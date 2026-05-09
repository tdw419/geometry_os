; DESCRIPTION: Renders a white box of size 23x101 starting at (471, 67).
; PLAN: r0=471(x), r1=67(y), r2=23(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 67
LDI r2, 23
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
