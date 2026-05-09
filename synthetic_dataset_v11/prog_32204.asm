; DESCRIPTION: Renders a yellow box of size 74x58 starting at (169, 169).
; PLAN: r0=169(x), r1=169(y), r2=74(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 169
LDI r2, 74
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
