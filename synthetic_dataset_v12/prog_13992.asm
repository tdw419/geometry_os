; DESCRIPTION: Renders a red line between points (493, 41) and (214, 114).
; PLAN: r0=493(x1), r1=41(y1), r2=214(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 41
LDI r2, 214
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
