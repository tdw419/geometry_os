; DESCRIPTION: Renders a black box of size 11x100 starting at (237, 96).
; PLAN: r0=237(x), r1=96(y), r2=11(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 96
LDI r2, 11
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
