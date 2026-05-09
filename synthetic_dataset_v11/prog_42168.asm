; DESCRIPTION: Renders a green box of size 72x118 starting at (35, 116).
; PLAN: r0=35(x), r1=116(y), r2=72(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 116
LDI r2, 72
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
