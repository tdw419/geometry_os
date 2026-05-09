; DESCRIPTION: Places a purple line segment connecting (66, 60) to (120, 206).
; PLAN: r0=66(x1), r1=60(y1), r2=120(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 60
LDI r2, 120
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
