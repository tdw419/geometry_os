; DESCRIPTION: Renders a yellow box of size 116x43 starting at (95, 163).
; PLAN: r0=95(x), r1=163(y), r2=116(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 163
LDI r2, 116
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
