; DESCRIPTION: Renders a black line between points (293, 223) and (142, 70).
; PLAN: r0=293(x1), r1=223(y1), r2=142(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 223
LDI r2, 142
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
