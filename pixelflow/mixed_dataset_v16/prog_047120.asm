; DESCRIPTION: Renders a black box of size 51x89 starting at (181, 148).
; PLAN: r0=181(x), r1=148(y), r2=51(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 148
LDI r2, 51
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
