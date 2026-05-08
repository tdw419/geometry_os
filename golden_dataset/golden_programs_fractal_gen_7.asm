; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r5, 1
LDI r10, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r11, 0

y_loop:
  LDI r0, 0

  x_loop:
    MOV r1, r0
    AND r1, r11
    JNZ r1, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r4, r11
    JNZ r4, not_top
    LDI r4, 0xFF0000
    JMP have_color
    not_top:
    MOV r4, r0
    JNZ r4, not_left
    LDI r4, 0xFFFF00
    JMP have_color
    not_left:
    LDI r4, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r13, 80
    STORE r10, r13
    ADD r10, r5
    LDI r13, 83
    STORE r10, r13
    ADD r10, r5
    LDI r13, 69
    STORE r10, r13
    ADD r10, r5
    LDI r13, 84
    STORE r10, r13
    ADD r10, r5
    LDI r13, 73
    STORE r10, r13
    ADD r10, r5
    LDI r13, 32
    STORE r10, r13
    ADD r10, r5

    ; X coord = x * 32 as decimal
    MOV r13, r0
    LDI r16, 32
    MUL r13, r16
    CALL write_dec

    LDI r13, 44
    STORE r10, r13
    ADD r10, r5

    ; Y coord = y * 32 as decimal
    MOV r13, r11
    LDI r16, 32
    MUL r13, r16
    CALL write_dec

    LDI r13, 44
    STORE r10, r13
    ADD r10, r5

    ; Color as hex "0xHHHHHH"
    LDI r13, 48
    STORE r10, r13
    ADD r10, r5
    LDI r13, 120
    STORE r10, r13
    ADD r10, r5

    ; Write 6 hex nibbles from r4
    PUSH r31
    PUSH r4
    PUSH r8
    LDI r8, 20
    hex_loop:
      MOV r13, r4
      MOV r16, r8
      SHR r13, r16
      LDI r16, 15
      AND r13, r16
      LDI r16, 10
      CMP r13, r16
      BGE r6, hex_alpha
      LDI r16, 48
      ADD r13, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r13, r16
      hex_write:
      STORE r10, r13
      ADD r10, r5
      LDI r13, 4
      SUB r8, r13
      LDI r13, 31
      MOV r16, r8
      SAR r16, r13
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r8
    POP r4
    POP r31

    LDI r13, 10
    STORE r10, r13
    ADD r10, r5

    skip_pixel:
    ADD r0, r5
    LDI r13, 8
    CMP r0, r13
    BLT r6, x_loop

  ADD r11, r5
  LDI r13, 8
  CMP r11, r13
  BLT r6, y_loop

; Write HALT
LDI r13, 72
STORE r10, r13
ADD r10, r5
LDI r13, 65
STORE r10, r13
ADD r10, r5
LDI r13, 76
STORE r10, r13
ADD r10, r5
LDI r13, 84
STORE r10, r13
ADD r10, r5
LDI r13, 0
STORE r10, r13

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r13 = number (0-255)
;       r10 = canvas position (advances)
;       r5 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r13, wd_nonzero
  LDI r13, 48
  STORE r10, r13
  ADD r10, r5
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r13
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r10, r17
  ADD r10, r5
  MOV r17, r13
  DIV r17, r16
  MUL r17, r16
  SUB r13, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r13
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r10, r17
  ADD r10, r5
  MOV r17, r13
  DIV r17, r16
  MUL r17, r16
  SUB r13, r17
  LDI r16, 48
  ADD r13, r16
  STORE r10, r13
  ADD r10, r5
  wd_done:
  POP r31
  RET
