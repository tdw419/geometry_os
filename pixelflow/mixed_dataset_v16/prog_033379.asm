; DESCRIPTION: Draws a black line from (404, 145) to (260, 86).
; PLAN: r0=404(x1), r1=145(y1), r2=260(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 145
LDI r2, 260
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
