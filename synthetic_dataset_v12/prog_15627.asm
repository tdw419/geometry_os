; DESCRIPTION: Renders a red line between points (448, 33) and (299, 233).
; PLAN: r0=448(x1), r1=33(y1), r2=299(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 33
LDI r2, 299
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
