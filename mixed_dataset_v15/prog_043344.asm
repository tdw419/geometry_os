; DESCRIPTION: Renders a red line between points (503, 88) and (301, 33).
; PLAN: r0=503(x1), r1=88(y1), r2=301(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 88
LDI r2, 301
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
