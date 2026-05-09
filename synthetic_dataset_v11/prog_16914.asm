; DESCRIPTION: Places a purple line segment connecting (202, 70) to (209, 119).
; PLAN: r0=202(x1), r1=70(y1), r2=209(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 70
LDI r2, 209
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
