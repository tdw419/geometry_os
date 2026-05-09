; DESCRIPTION: Draws a black rectangle at (352, 49) with width 92 and height 55.
; PLAN: r0=352(x), r1=49(y), r2=92(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 49
LDI r2, 92
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
