; DESCRIPTION: Renders a black box of size 10x26 starting at (246, 112).
; PLAN: r0=246(x), r1=112(y), r2=10(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 112
LDI r2, 10
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
