; DESCRIPTION: Geometry OS program to draw a colored object.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r13, 1
LDI r1, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r3, 0

y_loop:
  LDI r4, 0

  x_loop:
    MOV r8, r4
    AND r8, r3
    JNZ r8, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r10, r3
    JNZ r10, not_top
    LDI r10, 0xFF0000
    JMP have_color
    not_top:
    MOV r10, r4
    JNZ r10, not_left
    LDI r10, 0xFFFF00
    JMP have_color
    not_left:
    LDI r10, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r7, 80
    STORE r1, r7
    ADD r1, r13
    LDI r7, 83
    STORE r1, r7
    ADD r1, r13
    LDI r7, 69
    STORE r1, r7
    ADD r1, r13
    LDI r7, 84
    STORE r1, r7
    ADD r1, r13
    LDI r7, 73
    STORE r1, r7
    ADD r1, r13
    LDI r7, 32
    STORE r1, r7
    ADD r1, r13

    ; X coord = x * 32 as decimal
    MOV r7, r4
    LDI r16, 32
    MUL r7, r16
    CALL write_dec

    LDI r7, 44
    STORE r1, r7
    ADD r1, r13

    ; Y coord = y * 32 as decimal
    MOV r7, r3
    LDI r16, 32
    MUL r7, r16
    CALL write_dec

    LDI r7, 44
    STORE r1, r7
    ADD r1, r13

    ; Color as hex "0xHHHHHH"
    LDI r7, 48
    STORE r1, r7
    ADD r1, r13
    LDI r7, 120
    STORE r1, r7
    ADD r1, r13

    ; Write 6 hex nibbles from r10
    PUSH r31
    PUSH r10
    PUSH r14
    LDI r14, 20
    hex_loop:
      MOV r7, r10
      MOV r16, r14
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
      STORE r1, r7
      ADD r1, r13
      LDI r7, 4
      SUB r14, r7
      LDI r7, 31
      MOV r16, r14
      SAR r16, r7
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r14
    POP r10
    POP r31

    LDI r7, 10
    STORE r1, r7
    ADD r1, r13

    skip_pixel:
    ADD r4, r13
    LDI r7, 8
    CMP r4, r7
    BLT r5, x_loop

  ADD r3, r13
  LDI r7, 8
  CMP r3, r7
  BLT r5, y_loop

; Write HALT
LDI r7, 72
STORE r1, r7
ADD r1, r13
LDI r7, 65
STORE r1, r7
ADD r1, r13
LDI r7, 76
STORE r1, r7
ADD r1, r13
LDI r7, 84
STORE r1, r7
ADD r1, r13
LDI r7, 0
STORE r1, r7

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r7 = number (0-255)
;       r1 = canvas position (advances)
;       r13 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r7, wd_nonzero
  LDI r7, 48
  STORE r1, r7
  ADD r1, r13
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r7
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r1, r17
  ADD r1, r13
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
  STORE r1, r17
  ADD r1, r13
  MOV r17, r7
  DIV r17, r16
  MUL r17, r16
  SUB r7, r17
  LDI r16, 48
  ADD r7, r16
  STORE r1, r7
  ADD r1, r13
  wd_done:
  POP r31
  RET
