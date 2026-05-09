; DESCRIPTION: Draws a green rectangle at (194, 166) with width 92 and height 46.
; PLAN: r0=194(x), r1=166(y), r2=92(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 166
LDI r2, 92
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
