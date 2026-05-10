; DESCRIPTION: Draws a yellow rectangle at (174, 102) with width 73 and height 49.
; PLAN: r0=174(x), r1=102(y), r2=73(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 102
LDI r2, 73
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
