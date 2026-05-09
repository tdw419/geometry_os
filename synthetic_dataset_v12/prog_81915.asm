; DESCRIPTION: Draws a yellow rectangle at (183, 77) with width 92 and height 98.
; PLAN: r0=183(x), r1=77(y), r2=92(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 77
LDI r2, 92
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
