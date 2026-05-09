; DESCRIPTION: Draws a black line from (489, 221) to (363, 72).
; PLAN: r0=489(x1), r1=221(y1), r2=363(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 221
LDI r2, 363
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
