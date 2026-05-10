; DESCRIPTION: Renders a magenta line between points (450, 96) and (451, 200).
; PLAN: r0=450(x1), r1=96(y1), r2=451(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 96
LDI r2, 451
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
