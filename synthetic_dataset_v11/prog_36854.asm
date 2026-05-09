; DESCRIPTION: Renders a red line between points (198, 114) and (130, 110).
; PLAN: r0=198(x1), r1=114(y1), r2=130(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 114
LDI r2, 130
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
