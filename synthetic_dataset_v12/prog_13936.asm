; DESCRIPTION: Draws a green rectangle at (162, 19) with width 109 and height 47.
; PLAN: r0=162(x), r1=19(y), r2=109(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 19
LDI r2, 109
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
