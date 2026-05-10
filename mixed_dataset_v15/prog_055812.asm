; DESCRIPTION: Renders a black box of size 114x82 starting at (8, 96).
; PLAN: r0=8(x), r1=96(y), r2=114(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 96
LDI r2, 114
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
