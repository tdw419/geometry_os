; DESCRIPTION: Draws a black line from (364, 37) to (145, 207).
; PLAN: r0=364(x1), r1=37(y1), r2=145(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 37
LDI r2, 145
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
