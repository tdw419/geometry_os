; DESCRIPTION: Draws a yellow rectangle at (388, 39) with width 34 and height 101.
; PLAN: r0=388(x), r1=39(y), r2=34(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 39
LDI r2, 34
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
