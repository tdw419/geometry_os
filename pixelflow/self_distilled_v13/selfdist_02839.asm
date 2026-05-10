; DESCRIPTION: Renders a orange line segment connecting (384, 100) to (94, 167).
; PLAN: r0=384(x1), r1=100(y1), r2=94(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 100
LDI r2, 94
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
