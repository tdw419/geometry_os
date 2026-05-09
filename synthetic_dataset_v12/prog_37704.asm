; DESCRIPTION: Places a black line segment connecting (251, 231) to (417, 124).
; PLAN: r0=251(x1), r1=231(y1), r2=417(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 231
LDI r2, 417
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
