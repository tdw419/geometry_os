; DESCRIPTION: Draws a black line from (407, 189) to (414, 250).
; PLAN: r0=407(x1), r1=189(y1), r2=414(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 189
LDI r2, 414
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
