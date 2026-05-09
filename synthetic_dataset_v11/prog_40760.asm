; DESCRIPTION: Renders a white box of size 15x73 starting at (181, 58).
; PLAN: r0=181(x), r1=58(y), r2=15(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 58
LDI r2, 15
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
