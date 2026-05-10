; DESCRIPTION: Renders a purple line segment connecting (50, 25) to (160, 57).
; PLAN: r0=50(x1), r1=25(y1), r2=160(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 25
LDI r2, 160
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
