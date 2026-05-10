; DESCRIPTION: Renders a purple line segment connecting (34, 41) to (42, 180).
; PLAN: r0=34(x1), r1=41(y1), r2=42(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 41
LDI r2, 42
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
