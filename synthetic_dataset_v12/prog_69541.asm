; DESCRIPTION: Draws a red line from (500, 230) to (83, 73).
; PLAN: r0=500(x1), r1=230(y1), r2=83(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 230
LDI r2, 83
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
