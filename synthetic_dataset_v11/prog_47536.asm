; DESCRIPTION: Renders a black box of size 62x72 starting at (24, 141).
; PLAN: r0=24(x), r1=141(y), r2=62(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 141
LDI r2, 62
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
