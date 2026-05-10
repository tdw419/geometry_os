; DESCRIPTION: Renders a purple line segment connecting (82, 172) to (50, 91).
; PLAN: r0=82(x1), r1=172(y1), r2=50(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 172
LDI r2, 50
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
