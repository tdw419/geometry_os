; DESCRIPTION: Renders a magenta line segment connecting (168, 41) to (259, 38).
; PLAN: r0=168(x1), r1=41(y1), r2=259(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 41
LDI r2, 259
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
