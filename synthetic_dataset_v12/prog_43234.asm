; DESCRIPTION: Renders a black box of size 93x14 starting at (414, 194).
; PLAN: r0=414(x), r1=194(y), r2=93(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 194
LDI r2, 93
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
