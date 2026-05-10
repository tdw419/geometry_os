; DESCRIPTION: Draws a green rectangle at (128, 45) with width 105 and height 81.
; PLAN: r0=128(x), r1=45(y), r2=105(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 45
LDI r2, 105
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
