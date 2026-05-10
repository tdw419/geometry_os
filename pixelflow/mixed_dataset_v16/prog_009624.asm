; DESCRIPTION: Renders a black box of size 51x78 starting at (173, 147).
; PLAN: r0=173(x), r1=147(y), r2=51(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 147
LDI r2, 51
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
