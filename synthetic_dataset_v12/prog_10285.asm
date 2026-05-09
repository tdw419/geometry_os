; DESCRIPTION: Draws a yellow rectangle at (388, 73) with width 17 and height 115.
; PLAN: r0=388(x), r1=73(y), r2=17(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 73
LDI r2, 17
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
