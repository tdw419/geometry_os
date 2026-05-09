; DESCRIPTION: Draws a black rectangle at (123, 5) with width 92 and height 105.
; PLAN: r0=123(x), r1=5(y), r2=92(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 5
LDI r2, 92
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
