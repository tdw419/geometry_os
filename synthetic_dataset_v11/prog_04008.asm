; DESCRIPTION: Renders a black box of size 100x37 starting at (73, 18).
; PLAN: r0=73(x), r1=18(y), r2=100(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 18
LDI r2, 100
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
