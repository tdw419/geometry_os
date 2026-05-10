; DESCRIPTION: Draws a black rectangle at (18, 92) with width 112 and height 12.
; PLAN: r0=18(x), r1=92(y), r2=112(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 92
LDI r2, 112
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
