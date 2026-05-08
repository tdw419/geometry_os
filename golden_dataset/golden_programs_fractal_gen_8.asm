; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r7, 1
LDI r8, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r6, 0

y_loop:
  LDI r1, 0

  x_loop:
    MOV r15, r1
    AND r15, r6
    JNZ r15, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r10, r6
    JNZ r10, not_top
    LDI r10, 0xFF0000
    JMP have_color
    not_top:
    MOV r10, r1
    JNZ r10, not_left
    LDI r10, 0xFFFF00
    JMP have_color
    not_left:
    LDI r10, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r14, 80
    STORE r8, r14
    ADD r8, r7
    LDI r14, 83
    STORE r8, r14
    ADD r8, r7
    LDI r14, 69
    STORE r8, r14
    ADD r8, r7
    LDI r14, 84
    STORE r8, r14
    ADD r8, r7
    LDI r14, 73
    STORE r8, r14
    ADD r8, r7
    LDI r14, 32
    STORE r8, r14
    ADD r8, r7

    ; X coord = x * 32 as decimal
    MOV r14, r1
    LDI r16, 32
    MUL r14, r16
    CALL write_dec

    LDI r14, 44
    STORE r8, r14
    ADD r8, r7

    ; Y coord = y * 32 as decimal
    MOV r14, r6
    LDI r16, 32
    MUL r14, r16
    CALL write_dec

    LDI r14, 44
    STORE r8, r14
    ADD r8, r7

    ; Color as hex "0xHHHHHH"
    LDI r14, 48
    STORE r8, r14
    ADD r8, r7
    LDI r14, 120
    STORE r8, r14
    ADD r8, r7

    ; Write 6 hex nibbles from r10
    PUSH r31
    PUSH r10
    PUSH r3
    LDI r3, 20
    hex_loop:
      MOV r14, r10
      MOV r16, r3
      SHR r14, r16
      LDI r16, 15
      AND r14, r16
      LDI r16, 10
      CMP r14, r16
      BGE r11, hex_alpha
      LDI r16, 48
      ADD r14, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r14, r16
      hex_write:
      STORE r8, r14
      ADD r8, r7
      LDI r14, 4
      SUB r3, r14
      LDI r14, 31
      MOV r16, r3
      SAR r16, r14
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r3
    POP r10
    POP r31

    LDI r14, 10
    STORE r8, r14
    ADD r8, r7

    skip_pixel:
    ADD r1, r7
    LDI r14, 8
    CMP r1, r14
    BLT r11, x_loop

  ADD r6, r7
  LDI r14, 8
  CMP r6, r14
  BLT r11, y_loop

; Write HALT
LDI r14, 72
STORE r8, r14
ADD r8, r7
LDI r14, 65
STORE r8, r14
ADD r8, r7
LDI r14, 76
STORE r8, r14
ADD r8, r7
LDI r14, 84
STORE r8, r14
ADD r8, r7
LDI r14, 0
STORE r8, r14

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r14 = number (0-255)
;       r8 = canvas position (advances)
;       r7 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r14, wd_nonzero
  LDI r14, 48
  STORE r8, r14
  ADD r8, r7
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r14
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r8, r17
  ADD r8, r7
  MOV r17, r14
  DIV r17, r16
  MUL r17, r16
  SUB r14, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r14
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r8, r17
  ADD r8, r7
  MOV r17, r14
  DIV r17, r16
  MUL r17, r16
  SUB r14, r17
  LDI r16, 48
  ADD r14, r16
  STORE r8, r14
  ADD r8, r7
  wd_done:
  POP r31
  RET
