; DESCRIPTION: Renders a green line between points (170, 187) and (78, 89).
; PLAN: r0=170(x1), r1=187(y1), r2=78(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 187
LDI r2, 78
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
