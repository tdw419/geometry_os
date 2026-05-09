; DESCRIPTION: Renders a yellow box of size 96x100 starting at (148, 79).
; PLAN: r0=148(x), r1=79(y), r2=96(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 79
LDI r2, 96
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
