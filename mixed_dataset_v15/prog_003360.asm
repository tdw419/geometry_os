; DESCRIPTION: Renders a black box of size 101x18 starting at (332, 82).
; PLAN: r0=332(x), r1=82(y), r2=101(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 82
LDI r2, 101
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
