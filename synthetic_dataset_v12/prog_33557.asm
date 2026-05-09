; DESCRIPTION: Renders a red line between points (231, 52) and (41, 83).
; PLAN: r0=231(x1), r1=52(y1), r2=41(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 52
LDI r2, 41
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
