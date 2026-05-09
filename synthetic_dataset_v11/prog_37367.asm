; DESCRIPTION: Draws a black rectangle at (132, 3) with width 61 and height 100.
; PLAN: r0=132(x), r1=3(y), r2=61(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 3
LDI r2, 61
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
