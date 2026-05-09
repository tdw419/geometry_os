; DESCRIPTION: Draws a white rectangle at (100, 191) with width 99 and height 51.
; PLAN: r0=100(x), r1=191(y), r2=99(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 191
LDI r2, 99
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
