; DESCRIPTION: Renders a red line between points (50, 200) and (1, 206).
; PLAN: r0=50(x1), r1=200(y1), r2=1(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 200
LDI r2, 1
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
