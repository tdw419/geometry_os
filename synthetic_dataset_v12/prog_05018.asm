; DESCRIPTION: Draws a green rectangle at (18, 86) with width 51 and height 78.
; PLAN: r0=18(x), r1=86(y), r2=51(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 86
LDI r2, 51
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
