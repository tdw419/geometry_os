; DESCRIPTION: Renders a black box of size 54x118 starting at (86, 82).
; PLAN: r0=86(x), r1=82(y), r2=54(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 82
LDI r2, 54
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
