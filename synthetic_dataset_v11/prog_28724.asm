; DESCRIPTION: Places a purple line segment connecting (121, 137) to (206, 180).
; PLAN: r0=121(x1), r1=137(y1), r2=206(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 137
LDI r2, 206
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
