; DESCRIPTION: Renders a blue box of size 116x49 starting at (31, 123).
; PLAN: r0=31(x), r1=123(y), r2=116(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 123
LDI r2, 116
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
