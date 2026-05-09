; DESCRIPTION: Renders a black box of size 24x106 starting at (12, 71).
; PLAN: r0=12(x), r1=71(y), r2=24(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 71
LDI r2, 24
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
