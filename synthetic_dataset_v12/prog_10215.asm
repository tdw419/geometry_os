; DESCRIPTION: Renders a yellow box of size 116x79 starting at (153, 35).
; PLAN: r0=153(x), r1=35(y), r2=116(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 35
LDI r2, 116
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
