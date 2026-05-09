; DESCRIPTION: Renders a red line between points (184, 34) and (43, 218).
; PLAN: r0=184(x1), r1=34(y1), r2=43(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 34
LDI r2, 43
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
