; DESCRIPTION: Renders a yellow line between points (110, 194) and (50, 11).
; PLAN: r0=110(x1), r1=194(y1), r2=50(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 194
LDI r2, 50
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
