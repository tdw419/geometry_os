; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r3, 1
LDI r0, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r12, 0

y_loop:
  LDI r15, 0

  x_loop:
    MOV r7, r15
    AND r7, r12
    JNZ r7, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r8, r12
    JNZ r8, not_top
    LDI r8, 0xFF0000
    JMP have_color
    not_top:
    MOV r8, r15
    JNZ r8, not_left
    LDI r8, 0xFFFF00
    JMP have_color
    not_left:
    LDI r8, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r10, 80
    STORE r0, r10
    ADD r0, r3
    LDI r10, 83
    STORE r0, r10
    ADD r0, r3
    LDI r10, 69
    STORE r0, r10
    ADD r0, r3
    LDI r10, 84
    STORE r0, r10
    ADD r0, r3
    LDI r10, 73
    STORE r0, r10
    ADD r0, r3
    LDI r10, 32
    STORE r0, r10
    ADD r0, r3

    ; X coord = x * 32 as decimal
    MOV r10, r15
    LDI r16, 32
    MUL r10, r16
    CALL write_dec

    LDI r10, 44
    STORE r0, r10
    ADD r0, r3

    ; Y coord = y * 32 as decimal
    MOV r10, r12
    LDI r16, 32
    MUL r10, r16
    CALL write_dec

    LDI r10, 44
    STORE r0, r10
    ADD r0, r3

    ; Color as hex "0xHHHHHH"
    LDI r10, 48
    STORE r0, r10
    ADD r0, r3
    LDI r10, 120
    STORE r0, r10
    ADD r0, r3

    ; Write 6 hex nibbles from r8
    PUSH r31
    PUSH r8
    PUSH r11
    LDI r11, 20
    hex_loop:
      MOV r10, r8
      MOV r16, r11
      SHR r10, r16
      LDI r16, 15
      AND r10, r16
      LDI r16, 10
      CMP r10, r16
      BGE r13, hex_alpha
      LDI r16, 48
      ADD r10, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r10, r16
      hex_write:
      STORE r0, r10
      ADD r0, r3
      LDI r10, 4
      SUB r11, r10
      LDI r10, 31
      MOV r16, r11
      SAR r16, r10
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r11
    POP r8
    POP r31

    LDI r10, 10
    STORE r0, r10
    ADD r0, r3

    skip_pixel:
    ADD r15, r3
    LDI r10, 8
    CMP r15, r10
    BLT r13, x_loop

  ADD r12, r3
  LDI r10, 8
  CMP r12, r10
  BLT r13, y_loop

; Write HALT
LDI r10, 72
STORE r0, r10
ADD r0, r3
LDI r10, 65
STORE r0, r10
ADD r0, r3
LDI r10, 76
STORE r0, r10
ADD r0, r3
LDI r10, 84
STORE r0, r10
ADD r0, r3
LDI r10, 0
STORE r0, r10

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r10 = number (0-255)
;       r0 = canvas position (advances)
;       r3 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r10, wd_nonzero
  LDI r10, 48
  STORE r0, r10
  ADD r0, r3
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r10
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r0, r17
  ADD r0, r3
  MOV r17, r10
  DIV r17, r16
  MUL r17, r16
  SUB r10, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r10
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r0, r17
  ADD r0, r3
  MOV r17, r10
  DIV r17, r16
  MUL r17, r16
  SUB r10, r17
  LDI r16, 48
  ADD r10, r16
  STORE r0, r10
  ADD r0, r3
  wd_done:
  POP r31
  RET
