; DESCRIPTION: Draws a yellow rectangle at (303, 73) with width 105 and height 80.
; PLAN: r0=303(x), r1=73(y), r2=105(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 73
LDI r2, 105
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
