; DESCRIPTION: Renders a black box of size 107x33 starting at (265, 112).
; PLAN: r0=265(x), r1=112(y), r2=107(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 112
LDI r2, 107
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
