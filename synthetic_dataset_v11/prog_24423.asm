; DESCRIPTION: Renders a black line between points (234, 45) and (70, 147).
; PLAN: r0=234(x1), r1=45(y1), r2=70(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 45
LDI r2, 70
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
