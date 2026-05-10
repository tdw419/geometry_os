; DESCRIPTION: Renders a green line between points (39, 12) and (377, 41).
; PLAN: r0=39(x1), r1=12(y1), r2=377(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 12
LDI r2, 377
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
