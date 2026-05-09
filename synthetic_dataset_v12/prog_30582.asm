; DESCRIPTION: Draws a black line from (378, 229) to (368, 218).
; PLAN: r0=378(x1), r1=229(y1), r2=368(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 229
LDI r2, 368
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
