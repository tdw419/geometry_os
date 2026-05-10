; DESCRIPTION: Renders a green line between points (332, 187) and (287, 123).
; PLAN: r0=332(x1), r1=187(y1), r2=287(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 187
LDI r2, 287
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
