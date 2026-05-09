; DESCRIPTION: Renders a yellow box of size 85x89 starting at (149, 167).
; PLAN: r0=149(x), r1=167(y), r2=85(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 167
LDI r2, 85
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
