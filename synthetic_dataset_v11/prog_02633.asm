; DESCRIPTION: Draws a black rectangle at (116, 153) with width 92 and height 52.
; PLAN: r0=116(x), r1=153(y), r2=92(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 153
LDI r2, 92
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
