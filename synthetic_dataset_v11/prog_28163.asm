; DESCRIPTION: Renders a black box of size 50x101 starting at (35, 109).
; PLAN: r0=35(x), r1=109(y), r2=50(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 109
LDI r2, 50
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
