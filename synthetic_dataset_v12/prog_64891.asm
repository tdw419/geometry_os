; DESCRIPTION: Renders a green line between points (266, 127) and (19, 41).
; PLAN: r0=266(x1), r1=127(y1), r2=19(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 127
LDI r2, 19
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
