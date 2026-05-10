; DESCRIPTION: Renders a red line between points (32, 122) and (388, 41).
; PLAN: r0=32(x1), r1=122(y1), r2=388(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 122
LDI r2, 388
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
