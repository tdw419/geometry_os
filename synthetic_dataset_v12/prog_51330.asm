; DESCRIPTION: Renders a black box of size 10x13 starting at (26, 167).
; PLAN: r0=26(x), r1=167(y), r2=10(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 167
LDI r2, 10
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
