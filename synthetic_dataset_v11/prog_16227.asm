; DESCRIPTION: Draws a green rectangle at (64, 105) with width 56 and height 65.
; PLAN: r0=64(x), r1=105(y), r2=56(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 105
LDI r2, 56
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
