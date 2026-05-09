; DESCRIPTION: Draws a black rectangle at (37, 13) with width 92 and height 100.
; PLAN: r0=37(x), r1=13(y), r2=92(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 13
LDI r2, 92
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
