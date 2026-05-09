; DESCRIPTION: Renders a blue box of size 89x102 starting at (183, 106).
; PLAN: r0=183(x), r1=106(y), r2=89(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 106
LDI r2, 89
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
