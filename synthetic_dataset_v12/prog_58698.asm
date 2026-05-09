; DESCRIPTION: Draws a blue line from (351, 223) to (25, 234).
; PLAN: r0=351(x1), r1=223(y1), r2=25(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 223
LDI r2, 25
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
