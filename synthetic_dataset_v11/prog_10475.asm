; DESCRIPTION: Renders a yellow box of size 10x96 starting at (72, 55).
; PLAN: r0=72(x), r1=55(y), r2=10(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 55
LDI r2, 10
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
