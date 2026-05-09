; DESCRIPTION: Draws a yellow rectangle at (169, 179) with width 95 and height 71.
; PLAN: r0=169(x), r1=179(y), r2=95(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 179
LDI r2, 95
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
