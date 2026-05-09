; DESCRIPTION: Draws a green rectangle at (126, 18) with width 35 and height 78.
; PLAN: r0=126(x), r1=18(y), r2=35(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 18
LDI r2, 35
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
