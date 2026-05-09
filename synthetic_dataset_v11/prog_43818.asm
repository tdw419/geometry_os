; DESCRIPTION: Draws a green rectangle at (141, 115) with width 25 and height 30.
; PLAN: r0=141(x), r1=115(y), r2=25(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 115
LDI r2, 25
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
