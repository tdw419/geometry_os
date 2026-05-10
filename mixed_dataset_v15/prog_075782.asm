; DESCRIPTION: Renders a red line between points (198, 12) and (56, 110).
; PLAN: r0=198(x1), r1=12(y1), r2=56(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 12
LDI r2, 56
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
