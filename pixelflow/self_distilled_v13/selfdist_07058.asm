; DESCRIPTION: Renders a yellow line segment connecting (323, 180) to (273, 164).
; PLAN: r0=323(x1), r1=180(y1), r2=273(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 180
LDI r2, 273
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
