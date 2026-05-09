; DESCRIPTION: Draws a yellow rectangle at (177, 20) with width 60 and height 92.
; PLAN: r0=177(x), r1=20(y), r2=60(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 20
LDI r2, 60
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
