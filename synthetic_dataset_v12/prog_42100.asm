; DESCRIPTION: Draws a yellow rectangle at (469, 92) with width 11 and height 19.
; PLAN: r0=469(x), r1=92(y), r2=11(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 92
LDI r2, 11
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
