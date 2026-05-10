; DESCRIPTION: Renders a yellow rectangular region spanning 73 by 96 at (2, 10).
; PLAN: r0=2(x), r1=10(y), r2=73(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 10
LDI r2, 73
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
