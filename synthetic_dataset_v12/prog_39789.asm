; DESCRIPTION: Places a black line segment connecting (149, 215) to (428, 251).
; PLAN: r0=149(x1), r1=215(y1), r2=428(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 215
LDI r2, 428
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
