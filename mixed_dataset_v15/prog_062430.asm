; DESCRIPTION: Renders a green line between points (499, 41) and (99, 105).
; PLAN: r0=499(x1), r1=41(y1), r2=99(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 41
LDI r2, 99
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
