; DESCRIPTION: Draws a black rectangle at (115, 112) with width 19 and height 85.
; PLAN: r0=115(x), r1=112(y), r2=19(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 112
LDI r2, 19
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
