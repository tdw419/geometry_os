; DESCRIPTION: Draws a red line from (271, 109) to (273, 145).
; PLAN: r0=271(x1), r1=109(y1), r2=273(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 109
LDI r2, 273
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
