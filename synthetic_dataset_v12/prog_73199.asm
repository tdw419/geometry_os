; DESCRIPTION: Renders a black box of size 93x106 starting at (322, 8).
; PLAN: r0=322(x), r1=8(y), r2=93(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 8
LDI r2, 93
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
