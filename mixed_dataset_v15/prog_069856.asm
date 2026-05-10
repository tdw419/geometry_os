; DESCRIPTION: Renders a yellow box of size 37x116 starting at (10, 58).
; PLAN: r0=10(x), r1=58(y), r2=37(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 58
LDI r2, 37
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
