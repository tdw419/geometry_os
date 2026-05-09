; DESCRIPTION: Draws a red line from (400, 2) to (145, 221).
; PLAN: r0=400(x1), r1=2(y1), r2=145(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 2
LDI r2, 145
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
