; DESCRIPTION: Renders a yellow box of size 86x118 starting at (0, 76).
; PLAN: r0=0(x), r1=76(y), r2=86(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 76
LDI r2, 86
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
