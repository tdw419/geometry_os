; DESCRIPTION: Places a black line segment connecting (330, 89) to (132, 76).
; PLAN: r0=330(x1), r1=89(y1), r2=132(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 89
LDI r2, 132
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
