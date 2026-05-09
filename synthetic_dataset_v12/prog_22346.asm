; DESCRIPTION: Draws a green rectangle at (32, 132) with width 80 and height 21.
; PLAN: r0=32(x), r1=132(y), r2=80(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 132
LDI r2, 80
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
