; DESCRIPTION: Renders a red line between points (35, 125) and (130, 208).
; PLAN: r0=35(x1), r1=125(y1), r2=130(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 125
LDI r2, 130
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
