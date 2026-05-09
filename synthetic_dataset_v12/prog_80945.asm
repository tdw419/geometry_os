; DESCRIPTION: Renders a red line between points (374, 41) and (475, 81).
; PLAN: r0=374(x1), r1=41(y1), r2=475(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 41
LDI r2, 475
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
