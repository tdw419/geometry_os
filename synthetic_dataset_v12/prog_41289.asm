; DESCRIPTION: Renders a red line between points (432, 76) and (368, 26).
; PLAN: r0=432(x1), r1=76(y1), r2=368(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 76
LDI r2, 368
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
