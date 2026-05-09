; DESCRIPTION: Draws a green rectangle at (162, 178) with width 93 and height 46.
; PLAN: r0=162(x), r1=178(y), r2=93(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 178
LDI r2, 93
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
