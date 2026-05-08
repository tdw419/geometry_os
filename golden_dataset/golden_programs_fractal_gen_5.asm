; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r10, 1
LDI r7, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r12, 0

y_loop:
  LDI r15, 0

  x_loop:
    MOV r11, r15
    AND r11, r12
    JNZ r11, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r13, r12
    JNZ r13, not_top
    LDI r13, 0xFF0000
    JMP have_color
    not_top:
    MOV r13, r15
    JNZ r13, not_left
    LDI r13, 0xFFFF00
    JMP have_color
    not_left:
    LDI r13, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r1, 80
    STORE r7, r1
    ADD r7, r10
    LDI r1, 83
    STORE r7, r1
    ADD r7, r10
    LDI r1, 69
    STORE r7, r1
    ADD r7, r10
    LDI r1, 84
    STORE r7, r1
    ADD r7, r10
    LDI r1, 73
    STORE r7, r1
    ADD r7, r10
    LDI r1, 32
    STORE r7, r1
    ADD r7, r10

    ; X coord = x * 32 as decimal
    MOV r1, r15
    LDI r16, 32
    MUL r1, r16
    CALL write_dec

    LDI r1, 44
    STORE r7, r1
    ADD r7, r10

    ; Y coord = y * 32 as decimal
    MOV r1, r12
    LDI r16, 32
    MUL r1, r16
    CALL write_dec

    LDI r1, 44
    STORE r7, r1
    ADD r7, r10

    ; Color as hex "0xHHHHHH"
    LDI r1, 48
    STORE r7, r1
    ADD r7, r10
    LDI r1, 120
    STORE r7, r1
    ADD r7, r10

    ; Write 6 hex nibbles from r13
    PUSH r31
    PUSH r13
    PUSH r0
    LDI r0, 20
    hex_loop:
      MOV r1, r13
      MOV r16, r0
      SHR r1, r16
      LDI r16, 15
      AND r1, r16
      LDI r16, 10
      CMP r1, r16
      BGE r2, hex_alpha
      LDI r16, 48
      ADD r1, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r1, r16
      hex_write:
      STORE r7, r1
      ADD r7, r10
      LDI r1, 4
      SUB r0, r1
      LDI r1, 31
      MOV r16, r0
      SAR r16, r1
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r0
    POP r13
    POP r31

    LDI r1, 10
    STORE r7, r1
    ADD r7, r10

    skip_pixel:
    ADD r15, r10
    LDI r1, 8
    CMP r15, r1
    BLT r2, x_loop

  ADD r12, r10
  LDI r1, 8
  CMP r12, r1
  BLT r2, y_loop

; Write HALT
LDI r1, 72
STORE r7, r1
ADD r7, r10
LDI r1, 65
STORE r7, r1
ADD r7, r10
LDI r1, 76
STORE r7, r1
ADD r7, r10
LDI r1, 84
STORE r7, r1
ADD r7, r10
LDI r1, 0
STORE r7, r1

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r1 = number (0-255)
;       r7 = canvas position (advances)
;       r10 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r1, wd_nonzero
  LDI r1, 48
  STORE r7, r1
  ADD r7, r10
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r1
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r7, r17
  ADD r7, r10
  MOV r17, r1
  DIV r17, r16
  MUL r17, r16
  SUB r1, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r1
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r7, r17
  ADD r7, r10
  MOV r17, r1
  DIV r17, r16
  MUL r17, r16
  SUB r1, r17
  LDI r16, 48
  ADD r1, r16
  STORE r7, r1
  ADD r7, r10
  wd_done:
  POP r31
  RET
