; DESCRIPTION: Renders a black line between points (381, 44) and (171, 145).
; PLAN: r0=381(x1), r1=44(y1), r2=171(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 44
LDI r2, 171
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
