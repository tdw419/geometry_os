; DESCRIPTION: Places a black line segment connecting (277, 76) to (145, 107).
; PLAN: r0=277(x1), r1=76(y1), r2=145(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 76
LDI r2, 145
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
