; DESCRIPTION: Renders a green line segment connecting (312, 200) to (50, 146).
; PLAN: r0=312(x1), r1=200(y1), r2=50(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 200
LDI r2, 50
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
