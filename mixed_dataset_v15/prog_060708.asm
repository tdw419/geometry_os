; DESCRIPTION: Renders a red line between points (303, 187) and (453, 84).
; PLAN: r0=303(x1), r1=187(y1), r2=453(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 187
LDI r2, 453
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
