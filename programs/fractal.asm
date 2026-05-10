; fractal.asm - Mandelbrot/Julia Set Explorer
; Controls: WASD=pan, Q/E=zoom in/out, J=Julia toggle, R=reset
; 8x8 pixel blocks, 32 max iterations, 32-color HSV palette
; 8.8 fixed-point arithmetic
;
; Memory map:
; 0x2000-0x201F: 32-entry color palette (packed RGB)
; 0x2100: view_left (8.8 fixed point)
; 0x2101: view_top (8.8 fixed point)
; 0x2102: step (8.8 fixed, complex units per block)
; 0x2103: julia_mode (0=Mandelbrot, 1=Julia)
; 0x2104: julia_cr (8.8 fixed)
; 0x2105: julia_ci (8.8 fixed)

; ===== COLOR PALETTE (32 entries at 0x2000) =====
LDI r7, 0xFF0000
LDI r6, 0x2000
STORE r6, r7
LDI r7, 0xFF2F00
LDI r6, 0x2001
STORE r6, r7
LDI r7, 0xFF5F00
LDI r6, 0x2002
STORE r6, r7
LDI r7, 0xFF8F00
LDI r6, 0x2003
STORE r6, r7
LDI r7, 0xFFBF00
LDI r6, 0x2004
STORE r6, r7
LDI r7, 0xFFEF00
LDI r6, 0x2005
STORE r6, r7
LDI r7, 0xDFFF00
LDI r6, 0x2006
STORE r6, r7
LDI r7, 0xAFFF00
LDI r6, 0x2007
STORE r6, r7
LDI r7, 0x7FFF00
LDI r6, 0x2008
STORE r6, r7
LDI r7, 0x4FFF00
LDI r6, 0x2009
STORE r6, r7
LDI r7, 0x1FFF00
LDI r6, 0x200A
STORE r6, r7
LDI r7, 0x00FF0F
LDI r6, 0x200B
STORE r6, r7
LDI r7, 0x00FF3F
LDI r6, 0x200C
STORE r6, r7
LDI r7, 0x00FF6F
LDI r6, 0x200D
STORE r6, r7
LDI r7, 0x00FF9F
LDI r6, 0x200E
STORE r6, r7
LDI r7, 0x00FFCF
LDI r6, 0x200F
STORE r6, r7
LDI r7, 0x00FFFF
LDI r6, 0x2010
STORE r6, r7
LDI r7, 0x00CFFF
LDI r6, 0x2011
STORE r6, r7
LDI r7, 0x009FFF
LDI r6, 0x2012
STORE r6, r7
LDI r7, 0x006FFF
LDI r6, 0x2013
STORE r6, r7
LDI r7, 0x003FFF
LDI r6, 0x2014
STORE r6, r7
LDI r7, 0x000FFF
LDI r6, 0x2015
STORE r6, r7
LDI r7, 0x1F00FF
LDI r6, 0x2016
STORE r6, r7
LDI r7, 0x4F00FF
LDI r6, 0x2017
STORE r6, r7
LDI r7, 0x7F00FF
LDI r6, 0x2018
STORE r6, r7
LDI r7, 0xAF00FF
LDI r6, 0x2019
STORE r6, r7
LDI r7, 0xDF00FF
LDI r6, 0x201A
STORE r6, r7
LDI r7, 0xFF00EF
LDI r6, 0x201B
STORE r6, r7
LDI r7, 0xFF00BF
LDI r6, 0x201C
STORE r6, r7
LDI r7, 0xFF008F
LDI r6, 0x201D
STORE r6, r7
LDI r7, 0xFF005F
LDI r6, 0x201E
STORE r6, r7
LDI r7, 0xFF002F
LDI r6, 0x201F
STORE r6, r7

; ===== VIEW PARAMETERS =====
; view_left = -2.5 (8.8: -640)
LDI r7, 640
NEG r7
LDI r6, 0x2100
STORE r6, r7
; view_top = -2.0 (8.8: -512)
LDI r7, 512
NEG r7
LDI r6, 0x2101
STORE r6, r7
; step = 4.0/32 = 0.125 (8.8: 32)
LDI r7, 32
LDI r6, 0x2102
STORE r6, r7
; julia_mode = 0
LDI r7, 0
LDI r6, 0x2103
STORE r6, r7
; julia_cr = -0.7 (8.8: -179)
LDI r7, 179
NEG r7
LDI r6, 0x2104
STORE r6, r7
; julia_ci = 0.27015 (8.8: 69)
LDI r7, 69
LDI r6, 0x2105
STORE r6, r7

; ===== CONSTANTS =====
LDI r7, 1
LDI r8, 32
LDI r9, 262144
LDI r12, 32
LDI r13, 8
LDI r14, 0x2000
LDI r22, 8
LDI r23, 8
LDI r28, 3

; ===== MAIN LOOP =====
frame_loop:
LDI r6, 0
FILL r6
; Load view params
LDI r6, 0x2100
LOAD r15, r6
LDI r6, 0x2101
LOAD r16, r6
LDI r6, 0x2102
LOAD r17, r6
LDI r6, 0x2103
LOAD r25, r6
LDI r6, 0x2104
LOAD r26, r6
LDI r6, 0x2105
LOAD r27, r6
; Init y loop
MOV r19, r16
LDI r11, 0

; ===== Y LOOP =====
y_loop:
MOV r18, r15
LDI r10, 0

; ===== X LOOP =====
x_loop:
; Setup z, c based on mode
JZ r25, m_init
; Julia: z=pixel, c=constant
MOV r1, r18
MOV r2, r19
MOV r3, r26
MOV r4, r27
JMP iter_start
m_init:
; Mandelbrot: z=0, c=pixel
LDI r1, 0
LDI r2, 0
MOV r3, r18
MOV r4, r19

iter_start:
LDI r5, 0

; ===== ITERATION LOOP =====
; Uses 8.8 fixed-point: multiply gives 16.16, shift right 8 for result
; Escape check uses raw 16.16 sum vs threshold 262144 (4.0 * 65536)
iter_loop:
MOV r6, r1
MUL r6, r2
MUL r1, r1
MUL r2, r2
; Escape: zr^2 + zi^2 > 262144
MOV r20, r1
ADD r20, r2
CMP r20, r9
BGE r0, escaped
; zr_new = (zr^2 - zi^2)>>8 + cr
MOV r20, r1
SUB r20, r2
SHR r20, r13
ADD r20, r3
; zi_new = ((zr*zi)>>8)*2 + ci
SHR r6, r13
ADD r6, r6
ADD r6, r4
; Update z
MOV r1, r20
MOV r2, r6
ADD r5, r7
CMP r5, r8
BLT r0, iter_loop
; In set - black
LDI r24, 0
JMP draw

escaped:
; Color = palette[iter]
MOV r24, r5
ADD r24, r14
LOAD r24, r24

draw:
; Screen coords: block_x*8, block_y*8
MOV r20, r10
SHL r20, r28
MOV r21, r11
SHL r21, r28
RECTF r20, r21, r22, r23, r24
; Next block
ADD r18, r17
ADD r10, r7
CMP r10, r12
BLT r0, x_loop
; Next row
ADD r19, r17
ADD r11, r7
CMP r11, r12
BLT r0, y_loop

FRAME

; ===== KEYBOARD =====
IKEY r6
JZ r6, no_input

; W = pan up (87)
LDI r20, 87
CMP r6, r20
JNZ r0, not_w
LDI r6, 0x2102
LOAD r20, r6
LDI r6, 2
SHL r20, r6
LDI r6, 0x2101
LOAD r24, r6
SUB r24, r20
STORE r6, r24
JMP no_input

not_w:
; S = pan down (83)
LDI r20, 83
CMP r6, r20
JNZ r0, not_s
LDI r6, 0x2102
LOAD r20, r6
LDI r6, 2
SHL r20, r6
LDI r6, 0x2101
LOAD r24, r6
ADD r24, r20
STORE r6, r24
JMP no_input

not_s:
; A = pan left (65)
LDI r20, 65
CMP r6, r20
JNZ r0, not_a
LDI r6, 0x2102
LOAD r20, r6
LDI r6, 2
SHL r20, r6
LDI r6, 0x2100
LOAD r24, r6
SUB r24, r20
STORE r6, r24
JMP no_input

not_a:
; D = pan right (68)
LDI r20, 68
CMP r6, r20
JNZ r0, not_d
LDI r6, 0x2102
LOAD r20, r6
LDI r6, 2
SHL r20, r6
LDI r6, 0x2100
LOAD r24, r6
ADD r24, r20
STORE r6, r24
JMP no_input

not_d:
; Q = zoom in (81)
LDI r20, 81
CMP r6, r20
JNZ r0, not_q
LDI r6, 0x2102
LOAD r20, r6
MOV r21, r20
LDI r6, 3
SHL r21, r6
LDI r6, 0x2100
LOAD r24, r6
ADD r24, r21
STORE r6, r24
LDI r6, 0x2101
LOAD r24, r6
ADD r24, r21
STORE r6, r24
SHR r20, r7
LDI r6, 0x2102
STORE r6, r20
JMP no_input

not_q:
; E = zoom out (69)
LDI r20, 69
CMP r6, r20
JNZ r0, not_e
LDI r6, 0x2102
LOAD r20, r6
MOV r21, r20
LDI r6, 4
SHL r21, r6
LDI r6, 0x2100
LOAD r24, r6
SUB r24, r21
STORE r6, r24
LDI r6, 0x2101
LOAD r24, r6
SUB r24, r21
STORE r6, r24
SHL r20, r7
LDI r6, 0x2102
STORE r6, r20
JMP no_input

not_e:
; J = Julia toggle (74)
LDI r20, 74
CMP r6, r20
JNZ r0, not_j
LDI r6, 0x2103
LOAD r20, r6
LDI r21, 1
XOR r20, r21
STORE r6, r20
JMP no_input

not_j:
; R = reset (82)
LDI r20, 82
CMP r6, r20
JNZ r0, no_input
LDI r7, 640
NEG r7
LDI r6, 0x2100
STORE r6, r7
LDI r7, 512
NEG r7
LDI r6, 0x2101
STORE r6, r7
LDI r7, 32
LDI r6, 0x2102
STORE r6, r7
LDI r7, 0
LDI r6, 0x2103
STORE r6, r7
LDI r7, 179
NEG r7
LDI r6, 0x2104
STORE r6, r7
LDI r7, 69
LDI r6, 0x2105
STORE r6, r7
LDI r7, 1

no_input:
JMP frame_loop
