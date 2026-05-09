; DESCRIPTION: Renders a black box of size 58x101 starting at (126, 25).
; PLAN: r0=126(x), r1=25(y), r2=58(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 25
LDI r2, 58
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
