; DESCRIPTION: Places a purple line segment connecting (24, 211) to (392, 164).
; PLAN: r0=24(x1), r1=211(y1), r2=392(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 211
LDI r2, 392
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
