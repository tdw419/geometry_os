; DESCRIPTION: Renders a blue box of size 66x74 starting at (78, 33).
; PLAN: r0=78(x), r1=33(y), r2=66(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 33
LDI r2, 66
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
