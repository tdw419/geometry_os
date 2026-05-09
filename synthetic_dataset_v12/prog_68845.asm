; DESCRIPTION: Places a purple line segment connecting (393, 180) to (63, 159).
; PLAN: r0=393(x1), r1=180(y1), r2=63(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 180
LDI r2, 63
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
