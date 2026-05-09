; DESCRIPTION: Renders a black line between points (133, 20) and (329, 44).
; PLAN: r0=133(x1), r1=20(y1), r2=329(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 20
LDI r2, 329
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
