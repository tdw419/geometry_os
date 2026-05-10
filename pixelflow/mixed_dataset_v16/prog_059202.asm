; DESCRIPTION: Draws a yellow rectangle at (116, 131) with width 90 and height 110.
; PLAN: r0=116(x), r1=131(y), r2=90(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 131
LDI r2, 90
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
