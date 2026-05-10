; DESCRIPTION: Renders a black line between points (331, 30) and (330, 100).
; PLAN: r0=331(x1), r1=30(y1), r2=330(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 30
LDI r2, 330
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
