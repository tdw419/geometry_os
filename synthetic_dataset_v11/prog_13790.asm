; DESCRIPTION: Renders a red line between points (148, 187) and (41, 193).
; PLAN: r0=148(x1), r1=187(y1), r2=41(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 187
LDI r2, 41
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
