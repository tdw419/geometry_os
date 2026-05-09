; DESCRIPTION: Draws a black line from (365, 155) to (204, 109).
; PLAN: r0=365(x1), r1=155(y1), r2=204(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 155
LDI r2, 204
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
