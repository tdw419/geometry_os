; DESCRIPTION: Draws a yellow rectangle at (45, 26) with width 25 and height 92.
; PLAN: r0=45(x), r1=26(y), r2=25(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 26
LDI r2, 25
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
