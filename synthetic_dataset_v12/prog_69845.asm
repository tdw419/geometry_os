; DESCRIPTION: Renders a black box of size 25x14 starting at (51, 203).
; PLAN: r0=51(x), r1=203(y), r2=25(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 203
LDI r2, 25
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
