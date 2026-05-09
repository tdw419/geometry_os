; DESCRIPTION: Draws a yellow rectangle at (90, 121) with width 102 and height 44.
; PLAN: r0=90(x), r1=121(y), r2=102(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 121
LDI r2, 102
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
