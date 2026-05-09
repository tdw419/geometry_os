; DESCRIPTION: Renders a red line between points (3, 219) and (186, 16).
; PLAN: r0=3(x1), r1=219(y1), r2=186(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 219
LDI r2, 186
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
