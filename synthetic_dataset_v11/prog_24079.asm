; DESCRIPTION: Places a black line segment connecting (56, 174) to (213, 185).
; PLAN: r0=56(x1), r1=174(y1), r2=213(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 174
LDI r2, 213
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
