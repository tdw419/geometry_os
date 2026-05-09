; DESCRIPTION: Draws a black line from (363, 72) to (189, 9).
; PLAN: r0=363(x1), r1=72(y1), r2=189(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 72
LDI r2, 189
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
