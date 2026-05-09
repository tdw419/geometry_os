; DESCRIPTION: Renders a red line between points (68, 254) and (110, 24).
; PLAN: r0=68(x1), r1=254(y1), r2=110(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 254
LDI r2, 110
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
