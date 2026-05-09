; DESCRIPTION: Draws a green rectangle at (128, 15) with width 83 and height 78.
; PLAN: r0=128(x), r1=15(y), r2=83(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 15
LDI r2, 83
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
