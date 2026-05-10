; DESCRIPTION: Draws a black line from (207, 62) to (441, 2).
; PLAN: r0=207(x1), r1=62(y1), r2=441(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 62
LDI r2, 441
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
