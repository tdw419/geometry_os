; DESCRIPTION: Renders a black box of size 51x28 starting at (137, 19).
; PLAN: r0=137(x), r1=19(y), r2=51(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 19
LDI r2, 51
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
