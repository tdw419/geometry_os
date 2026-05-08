; DESCRIPTION: Render a colored object at the screen.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r12, 1
LDI r7, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r0, 0

y_loop:
  LDI r9, 0

  x_loop:
    MOV r15, r9
    AND r15, r0
    JNZ r15, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r10, r0
    JNZ r10, not_top
    LDI r10, 0xFF0000
    JMP have_color
    not_top:
    MOV r10, r9
    JNZ r10, not_left
    LDI r10, 0xFFFF00
    JMP have_color
    not_left:
    LDI r10, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r2, 80
    STORE r7, r2
    ADD r7, r12
    LDI r2, 83
    STORE r7, r2
    ADD r7, r12
    LDI r2, 69
    STORE r7, r2
    ADD r7, r12
    LDI r2, 84
    STORE r7, r2
    ADD r7, r12
    LDI r2, 73
    STORE r7, r2
    ADD r7, r12
    LDI r2, 32
    STORE r7, r2
    ADD r7, r12

    ; X coord = x * 32 as decimal
    MOV r2, r9
    LDI r16, 32
    MUL r2, r16
    CALL write_dec

    LDI r2, 44
    STORE r7, r2
    ADD r7, r12

    ; Y coord = y * 32 as decimal
    MOV r2, r0
    LDI r16, 32
    MUL r2, r16
    CALL write_dec

    LDI r2, 44
    STORE r7, r2
    ADD r7, r12

    ; Color as hex "0xHHHHHH"
    LDI r2, 48
    STORE r7, r2
    ADD r7, r12
    LDI r2, 120
    STORE r7, r2
    ADD r7, r12

    ; Write 6 hex nibbles from r10
    PUSH r31
    PUSH r10
    PUSH r13
    LDI r13, 20
    hex_loop:
      MOV r2, r10
      MOV r16, r13
      SHR r2, r16
      LDI r16, 15
      AND r2, r16
      LDI r16, 10
      CMP r2, r16
      BGE r5, hex_alpha
      LDI r16, 48
      ADD r2, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r2, r16
      hex_write:
      STORE r7, r2
      ADD r7, r12
      LDI r2, 4
      SUB r13, r2
      LDI r2, 31
      MOV r16, r13
      SAR r16, r2
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r13
    POP r10
    POP r31

    LDI r2, 10
    STORE r7, r2
    ADD r7, r12

    skip_pixel:
    ADD r9, r12
    LDI r2, 8
    CMP r9, r2
    BLT r5, x_loop

  ADD r0, r12
  LDI r2, 8
  CMP r0, r2
  BLT r5, y_loop

; Write HALT
LDI r2, 72
STORE r7, r2
ADD r7, r12
LDI r2, 65
STORE r7, r2
ADD r7, r12
LDI r2, 76
STORE r7, r2
ADD r7, r12
LDI r2, 84
STORE r7, r2
ADD r7, r12
LDI r2, 0
STORE r7, r2

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r2 = number (0-255)
;       r7 = canvas position (advances)
;       r12 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r2, wd_nonzero
  LDI r2, 48
  STORE r7, r2
  ADD r7, r12
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r2
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r7, r17
  ADD r7, r12
  MOV r17, r2
  DIV r17, r16
  MUL r17, r16
  SUB r2, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r2
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r7, r17
  ADD r7, r12
  MOV r17, r2
  DIV r17, r16
  MUL r17, r16
  SUB r2, r17
  LDI r16, 48
  ADD r2, r16
  STORE r7, r2
  ADD r7, r12
  wd_done:
  POP r31
  RET
