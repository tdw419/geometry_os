; RED BLUE STRIPES -- Horizontal stripes alternating red and blue, 16px tall
; Uses RECTF to fill 16 bands of height 16 (16 * 16 = 256)

LDI r10, 0xFF0000    ; r10 = red
LDI r11, 0x0000FF    ; r11 = blue
LDI r0, 0            ; x = 0
LDI r2, 256          ; width = 256
LDI r3, 16           ; height = 16

; Stripe 0: y=0, red
LDI r1, 0
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 1: y=16, blue
LDI r1, 16
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 2: y=32, red
LDI r1, 32
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 3: y=48, blue
LDI r1, 48
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 4: y=64, red
LDI r1, 64
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 5: y=80, blue
LDI r1, 80
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 6: y=96, red
LDI r1, 96
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 7: y=112, blue
LDI r1, 112
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 8: y=128, red
LDI r1, 128
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 9: y=144, blue
LDI r1, 144
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 10: y=160, red
LDI r1, 160
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 11: y=176, blue
LDI r1, 176
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 12: y=192, red
LDI r1, 192
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 13: y=208, blue
LDI r1, 208
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

; Stripe 14: y=224, red
LDI r1, 224
LDI r4, 0
ADD r4, r10
RECTF r0, r1, r2, r3, r4

; Stripe 15: y=240, blue
LDI r1, 240
LDI r4, 0
ADD r4, r11
RECTF r0, r1, r2, r3, r4

HALT
