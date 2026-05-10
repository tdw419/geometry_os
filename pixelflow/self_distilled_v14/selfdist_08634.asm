; DESCRIPTION: Renders a magenta line segment connecting (98, 87) to (208, 14).
; PLAN: r0=98(x1), r1=87(y1), r2=208(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 87
LDI r2, 208
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
