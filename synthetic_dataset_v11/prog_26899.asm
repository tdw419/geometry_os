; DESCRIPTION: Draws a yellow rectangle at (92, 90) with width 34 and height 90.
; PLAN: r0=92(x), r1=90(y), r2=34(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 90
LDI r2, 34
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
