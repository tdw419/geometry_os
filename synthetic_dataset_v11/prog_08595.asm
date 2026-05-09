; DESCRIPTION: Draws a black line from (133, 236) to (66, 109).
; PLAN: r0=133(x1), r1=236(y1), r2=66(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 236
LDI r2, 66
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
