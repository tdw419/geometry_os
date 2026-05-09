; DESCRIPTION: Draws a black rectangle at (163, 92) with width 52 and height 61.
; PLAN: r0=163(x), r1=92(y), r2=52(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 92
LDI r2, 52
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
