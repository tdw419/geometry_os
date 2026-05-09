; DESCRIPTION: Places a blue line segment connecting (251, 233) to (209, 97).
; PLAN: r0=251(x1), r1=233(y1), r2=209(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 233
LDI r2, 209
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
