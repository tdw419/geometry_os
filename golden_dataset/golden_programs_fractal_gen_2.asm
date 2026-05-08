; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r1, 1
LDI r0, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r11, 0

y_loop:
  LDI r13, 0

  x_loop:
    MOV r15, r13
    AND r15, r11
    JNZ r15, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r8, r11
    JNZ r8, not_top
    LDI r8, 0xFF0000
    JMP have_color
    not_top:
    MOV r8, r13
    JNZ r8, not_left
    LDI r8, 0xFFFF00
    JMP have_color
    not_left:
    LDI r8, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r7, 80
    STORE r0, r7
    ADD r0, r1
    LDI r7, 83
    STORE r0, r7
    ADD r0, r1
    LDI r7, 69
    STORE r0, r7
    ADD r0, r1
    LDI r7, 84
    STORE r0, r7
    ADD r0, r1
    LDI r7, 73
    STORE r0, r7
    ADD r0, r1
    LDI r7, 32
    STORE r0, r7
    ADD r0, r1

    ; X coord = x * 32 as decimal
    MOV r7, r13
    LDI r16, 32
    MUL r7, r16
    CALL write_dec

    LDI r7, 44
    STORE r0, r7
    ADD r0, r1

    ; Y coord = y * 32 as decimal
    MOV r7, r11
    LDI r16, 32
    MUL r7, r16
    CALL write_dec

    LDI r7, 44
    STORE r0, r7
    ADD r0, r1

    ; Color as hex "0xHHHHHH"
    LDI r7, 48
    STORE r0, r7
    ADD r0, r1
    LDI r7, 120
    STORE r0, r7
    ADD r0, r1

    ; Write 6 hex nibbles from r8
    PUSH r31
    PUSH r8
    PUSH r10
    LDI r10, 20
    hex_loop:
      MOV r7, r8
      MOV r16, r10
      SHR r7, r16
      LDI r16, 15
      AND r7, r16
      LDI r16, 10
      CMP r7, r16
      BGE r5, hex_alpha
      LDI r16, 48
      ADD r7, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r7, r16
      hex_write:
      STORE r0, r7
      ADD r0, r1
      LDI r7, 4
      SUB r10, r7
      LDI r7, 31
      MOV r16, r10
      SAR r16, r7
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r10
    POP r8
    POP r31

    LDI r7, 10
    STORE r0, r7
    ADD r0, r1

    skip_pixel:
    ADD r13, r1
    LDI r7, 8
    CMP r13, r7
    BLT r5, x_loop

  ADD r11, r1
  LDI r7, 8
  CMP r11, r7
  BLT r5, y_loop

; Write HALT
LDI r7, 72
STORE r0, r7
ADD r0, r1
LDI r7, 65
STORE r0, r7
ADD r0, r1
LDI r7, 76
STORE r0, r7
ADD r0, r1
LDI r7, 84
STORE r0, r7
ADD r0, r1
LDI r7, 0
STORE r0, r7

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r7 = number (0-255)
;       r0 = canvas position (advances)
;       r1 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r7, wd_nonzero
  LDI r7, 48
  STORE r0, r7
  ADD r0, r1
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r7
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r0, r17
  ADD r0, r1
  MOV r17, r7
  DIV r17, r16
  MUL r17, r16
  SUB r7, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r7
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r0, r17
  ADD r0, r1
  MOV r17, r7
  DIV r17, r16
  MUL r17, r16
  SUB r7, r17
  LDI r16, 48
  ADD r7, r16
  STORE r0, r7
  ADD r0, r1
  wd_done:
  POP r31
  RET
