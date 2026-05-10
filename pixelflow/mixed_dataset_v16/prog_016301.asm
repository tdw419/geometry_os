; DESCRIPTION: Places a black line segment connecting (132, 9) to (357, 175).
; PLAN: r0=132(x1), r1=9(y1), r2=357(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 9
LDI r2, 357
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
