; DESCRIPTION: Draws a red line from (268, 169) to (503, 196).
; PLAN: r0=268(x1), r1=169(y1), r2=503(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 169
LDI r2, 503
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
