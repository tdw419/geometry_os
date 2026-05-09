; DESCRIPTION: Renders a red line between points (416, 250) and (87, 41).
; PLAN: r0=416(x1), r1=250(y1), r2=87(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 250
LDI r2, 87
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
