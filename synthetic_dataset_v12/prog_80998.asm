; DESCRIPTION: Renders a blue box of size 31x34 starting at (184, 114).
; PLAN: r0=184(x), r1=114(y), r2=31(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 114
LDI r2, 31
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
