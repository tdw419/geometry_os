; DESCRIPTION: Renders a yellow line between points (475, 83) and (290, 105).
; PLAN: r0=475(x1), r1=83(y1), r2=290(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 83
LDI r2, 290
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
