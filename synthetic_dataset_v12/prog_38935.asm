; DESCRIPTION: Renders a red line between points (360, 201) and (236, 50).
; PLAN: r0=360(x1), r1=201(y1), r2=236(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 201
LDI r2, 236
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
