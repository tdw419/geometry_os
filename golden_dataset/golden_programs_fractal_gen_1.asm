; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r4, 1
LDI r5, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r2, 0

y_loop:
  LDI r15, 0

  x_loop:
    MOV r10, r15
    AND r10, r2
    JNZ r10, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r1, r2
    JNZ r1, not_top
    LDI r1, 0xFF0000
    JMP have_color
    not_top:
    MOV r1, r15
    JNZ r1, not_left
    LDI r1, 0xFFFF00
    JMP have_color
    not_left:
    LDI r1, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r14, 80
    STORE r5, r14
    ADD r5, r4
    LDI r14, 83
    STORE r5, r14
    ADD r5, r4
    LDI r14, 69
    STORE r5, r14
    ADD r5, r4
    LDI r14, 84
    STORE r5, r14
    ADD r5, r4
    LDI r14, 73
    STORE r5, r14
    ADD r5, r4
    LDI r14, 32
    STORE r5, r14
    ADD r5, r4

    ; X coord = x * 32 as decimal
    MOV r14, r15
    LDI r16, 32
    MUL r14, r16
    CALL write_dec

    LDI r14, 44
    STORE r5, r14
    ADD r5, r4

    ; Y coord = y * 32 as decimal
    MOV r14, r2
    LDI r16, 32
    MUL r14, r16
    CALL write_dec

    LDI r14, 44
    STORE r5, r14
    ADD r5, r4

    ; Color as hex "0xHHHHHH"
    LDI r14, 48
    STORE r5, r14
    ADD r5, r4
    LDI r14, 120
    STORE r5, r14
    ADD r5, r4

    ; Write 6 hex nibbles from r1
    PUSH r31
    PUSH r1
    PUSH r9
    LDI r9, 20
    hex_loop:
      MOV r14, r1
      MOV r16, r9
      SHR r14, r16
      LDI r16, 15
      AND r14, r16
      LDI r16, 10
      CMP r14, r16
      BGE r8, hex_alpha
      LDI r16, 48
      ADD r14, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r14, r16
      hex_write:
      STORE r5, r14
      ADD r5, r4
      LDI r14, 4
      SUB r9, r14
      LDI r14, 31
      MOV r16, r9
      SAR r16, r14
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r9
    POP r1
    POP r31

    LDI r14, 10
    STORE r5, r14
    ADD r5, r4

    skip_pixel:
    ADD r15, r4
    LDI r14, 8
    CMP r15, r14
    BLT r8, x_loop

  ADD r2, r4
  LDI r14, 8
  CMP r2, r14
  BLT r8, y_loop

; Write HALT
LDI r14, 72
STORE r5, r14
ADD r5, r4
LDI r14, 65
STORE r5, r14
ADD r5, r4
LDI r14, 76
STORE r5, r14
ADD r5, r4
LDI r14, 84
STORE r5, r14
ADD r5, r4
LDI r14, 0
STORE r5, r14

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r14 = number (0-255)
;       r5 = canvas position (advances)
;       r4 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r14, wd_nonzero
  LDI r14, 48
  STORE r5, r14
  ADD r5, r4
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r14
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r5, r17
  ADD r5, r4
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
  STORE r5, r17
  ADD r5, r4
  MOV r17, r14
  DIV r17, r16
  MUL r17, r16
  SUB r14, r17
  LDI r16, 48
  ADD r14, r16
  STORE r5, r14
  ADD r5, r4
  wd_done:
  POP r31
  RET
