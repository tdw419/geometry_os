; DESCRIPTION: Draws a green rectangle at (44, 153) with width 115 and height 10.
; PLAN: r0=44(x), r1=153(y), r2=115(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 153
LDI r2, 115
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
