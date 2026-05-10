; DESCRIPTION: Draws a green rectangle at (271, 132) with width 88 and height 87.
; PLAN: r0=271(x), r1=132(y), r2=88(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 132
LDI r2, 88
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
