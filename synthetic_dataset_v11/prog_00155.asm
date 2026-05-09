; DESCRIPTION: Renders a orange line between points (236, 200) and (21, 90).
; PLAN: r0=236(x1), r1=200(y1), r2=21(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 200
LDI r2, 21
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
