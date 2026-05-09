; DESCRIPTION: Renders a yellow line between points (58, 250) and (28, 41).
; PLAN: r0=58(x1), r1=250(y1), r2=28(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 250
LDI r2, 28
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
