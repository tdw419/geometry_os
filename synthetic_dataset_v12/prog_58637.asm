; DESCRIPTION: Renders a black box of size 92x107 starting at (17, 85).
; PLAN: r0=17(x), r1=85(y), r2=92(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 85
LDI r2, 92
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
