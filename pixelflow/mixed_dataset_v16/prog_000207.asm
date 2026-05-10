; DESCRIPTION: Draws a green rectangle at (256, 78) with width 105 and height 103.
; PLAN: r0=256(x), r1=78(y), r2=105(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 78
LDI r2, 105
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
