; DESCRIPTION: Draws a green rectangle at (1, 18) with width 12 and height 115.
; PLAN: r0=1(x), r1=18(y), r2=12(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 18
LDI r2, 12
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
