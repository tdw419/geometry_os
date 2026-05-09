; DESCRIPTION: Renders a red line between points (5, 219) and (31, 36).
; PLAN: r0=5(x1), r1=219(y1), r2=31(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 219
LDI r2, 31
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
