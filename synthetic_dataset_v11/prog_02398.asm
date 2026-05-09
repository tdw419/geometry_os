; DESCRIPTION: Draws a black line from (122, 89) to (211, 208).
; PLAN: r0=122(x1), r1=89(y1), r2=211(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 89
LDI r2, 211
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
