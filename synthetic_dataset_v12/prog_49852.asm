; DESCRIPTION: Renders a black box of size 89x51 starting at (261, 167).
; PLAN: r0=261(x), r1=167(y), r2=89(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 167
LDI r2, 89
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
