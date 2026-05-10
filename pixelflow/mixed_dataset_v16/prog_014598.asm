; DESCRIPTION: Renders a black line between points (325, 207) and (70, 142).
; PLAN: r0=325(x1), r1=207(y1), r2=70(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 207
LDI r2, 70
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
