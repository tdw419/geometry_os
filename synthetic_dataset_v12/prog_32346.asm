; DESCRIPTION: Draws a green rectangle at (237, 56) with width 58 and height 37.
; PLAN: r0=237(x), r1=56(y), r2=58(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 56
LDI r2, 58
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
