; DESCRIPTION: Renders a yellow line between points (40, 187) and (372, 114).
; PLAN: r0=40(x1), r1=187(y1), r2=372(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 187
LDI r2, 372
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
