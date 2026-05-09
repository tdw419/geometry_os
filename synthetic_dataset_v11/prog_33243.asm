; DESCRIPTION: Renders a blue box of size 54x89 starting at (161, 60).
; PLAN: r0=161(x), r1=60(y), r2=54(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 60
LDI r2, 54
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
