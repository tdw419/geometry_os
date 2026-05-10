; DESCRIPTION: Renders a green line segment connecting (158, 190) to (45, 80).
; PLAN: r0=158(x1), r1=190(y1), r2=45(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 190
LDI r2, 45
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
