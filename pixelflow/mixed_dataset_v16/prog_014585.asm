; DESCRIPTION: Draws a black line from (9, 218) to (453, 87).
; PLAN: r0=9(x1), r1=218(y1), r2=453(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 218
LDI r2, 453
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
