; DESCRIPTION: Draws a yellow rectangle at (367, 115) with width 119 and height 87.
; PLAN: r0=367(x), r1=115(y), r2=119(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 115
LDI r2, 119
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
