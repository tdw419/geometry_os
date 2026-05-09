; DESCRIPTION: Draws a red line from (56, 109) to (503, 205).
; PLAN: r0=56(x1), r1=109(y1), r2=503(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 109
LDI r2, 503
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
