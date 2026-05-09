; DESCRIPTION: Renders a black box of size 93x83 starting at (169, 88).
; PLAN: r0=169(x), r1=88(y), r2=93(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 88
LDI r2, 93
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
