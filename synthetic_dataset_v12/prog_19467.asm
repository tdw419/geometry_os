; DESCRIPTION: Renders a black line between points (234, 134) and (314, 174).
; PLAN: r0=234(x1), r1=134(y1), r2=314(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 134
LDI r2, 314
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
