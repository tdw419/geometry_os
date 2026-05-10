; DESCRIPTION: Draws a black rectangle at (87, 100) with width 92 and height 108.
; PLAN: r0=87(x), r1=100(y), r2=92(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 100
LDI r2, 92
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
