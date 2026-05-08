; DESCRIPTION: Geometry OS program to draw a colored object.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r10, 1
LDI r4, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r9, 0

y_loop:
  LDI r3, 0

  x_loop:
    MOV r13, r3
    AND r13, r9
    JNZ r13, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r11, r9
    JNZ r11, not_top
    LDI r11, 0xFF0000
    JMP have_color
    not_top:
    MOV r11, r3
    JNZ r11, not_left
    LDI r11, 0xFFFF00
    JMP have_color
    not_left:
    LDI r11, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r6, 80
    STORE r4, r6
    ADD r4, r10
    LDI r6, 83
    STORE r4, r6
    ADD r4, r10
    LDI r6, 69
    STORE r4, r6
    ADD r4, r10
    LDI r6, 84
    STORE r4, r6
    ADD r4, r10
    LDI r6, 73
    STORE r4, r6
    ADD r4, r10
    LDI r6, 32
    STORE r4, r6
    ADD r4, r10

    ; X coord = x * 32 as decimal
    MOV r6, r3
    LDI r16, 32
    MUL r6, r16
    CALL write_dec

    LDI r6, 44
    STORE r4, r6
    ADD r4, r10

    ; Y coord = y * 32 as decimal
    MOV r6, r9
    LDI r16, 32
    MUL r6, r16
    CALL write_dec

    LDI r6, 44
    STORE r4, r6
    ADD r4, r10

    ; Color as hex "0xHHHHHH"
    LDI r6, 48
    STORE r4, r6
    ADD r4, r10
    LDI r6, 120
    STORE r4, r6
    ADD r4, r10

    ; Write 6 hex nibbles from r11
    PUSH r31
    PUSH r11
    PUSH r15
    LDI r15, 20
    hex_loop:
      MOV r6, r11
      MOV r16, r15
      SHR r6, r16
      LDI r16, 15
      AND r6, r16
      LDI r16, 10
      CMP r6, r16
      BGE r1, hex_alpha
      LDI r16, 48
      ADD r6, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r6, r16
      hex_write:
      STORE r4, r6
      ADD r4, r10
      LDI r6, 4
      SUB r15, r6
      LDI r6, 31
      MOV r16, r15
      SAR r16, r6
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r15
    POP r11
    POP r31

    LDI r6, 10
    STORE r4, r6
    ADD r4, r10

    skip_pixel:
    ADD r3, r10
    LDI r6, 8
    CMP r3, r6
    BLT r1, x_loop

  ADD r9, r10
  LDI r6, 8
  CMP r9, r6
  BLT r1, y_loop

; Write HALT
LDI r6, 72
STORE r4, r6
ADD r4, r10
LDI r6, 65
STORE r4, r6
ADD r4, r10
LDI r6, 76
STORE r4, r6
ADD r4, r10
LDI r6, 84
STORE r4, r6
ADD r4, r10
LDI r6, 0
STORE r4, r6

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r6 = number (0-255)
;       r4 = canvas position (advances)
;       r10 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r6, wd_nonzero
  LDI r6, 48
  STORE r4, r6
  ADD r4, r10
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r6
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r4, r17
  ADD r4, r10
  MOV r17, r6
  DIV r17, r16
  MUL r17, r16
  SUB r6, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r6
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r4, r17
  ADD r4, r10
  MOV r17, r6
  DIV r17, r16
  MUL r17, r16
  SUB r6, r17
  LDI r16, 48
  ADD r6, r16
  STORE r4, r6
  ADD r4, r10
  wd_done:
  POP r31
  RET
