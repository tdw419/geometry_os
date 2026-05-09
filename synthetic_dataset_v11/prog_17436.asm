; DESCRIPTION: Renders a black box of size 52x49 starting at (51, 34).
; PLAN: r0=51(x), r1=34(y), r2=52(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 34
LDI r2, 52
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
