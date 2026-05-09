; DESCRIPTION: Places a purple line segment connecting (480, 201) to (259, 231).
; PLAN: r0=480(x1), r1=201(y1), r2=259(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 201
LDI r2, 259
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
