; DESCRIPTION: Places a purple line segment connecting (87, 160) to (398, 207).
; PLAN: r0=87(x1), r1=160(y1), r2=398(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 160
LDI r2, 398
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
