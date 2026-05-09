; DESCRIPTION: Places a black line segment connecting (181, 185) to (363, 46).
; PLAN: r0=181(x1), r1=185(y1), r2=363(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 185
LDI r2, 363
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
