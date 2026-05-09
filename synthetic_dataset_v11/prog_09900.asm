; DESCRIPTION: Places a purple line segment connecting (180, 60) to (110, 189).
; PLAN: r0=180(x1), r1=60(y1), r2=110(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 60
LDI r2, 110
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
