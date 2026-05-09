; DESCRIPTION: Renders a yellow line between points (41, 229) and (238, 243).
; PLAN: r0=41(x1), r1=229(y1), r2=238(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 229
LDI r2, 238
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
