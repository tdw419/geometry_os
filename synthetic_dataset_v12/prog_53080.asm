; DESCRIPTION: Draws a black line from (431, 207) to (379, 159).
; PLAN: r0=431(x1), r1=207(y1), r2=379(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 207
LDI r2, 379
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
