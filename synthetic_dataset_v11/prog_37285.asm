; DESCRIPTION: Renders a blue box of size 89x53 starting at (112, 31).
; PLAN: r0=112(x), r1=31(y), r2=89(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 31
LDI r2, 89
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
