; DESCRIPTION: Renders a green line between points (125, 119) and (371, 41).
; PLAN: r0=125(x1), r1=119(y1), r2=371(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 119
LDI r2, 371
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
