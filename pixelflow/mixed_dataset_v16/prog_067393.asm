; DESCRIPTION: Renders a purple line between points (63, 45) and (251, 50).
; PLAN: r0=63(x1), r1=45(y1), r2=251(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 45
LDI r2, 251
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
