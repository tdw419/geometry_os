; DESCRIPTION: Renders a red line between points (26, 27) and (322, 41).
; PLAN: r0=26(x1), r1=27(y1), r2=322(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 27
LDI r2, 322
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
