; DESCRIPTION: Renders a yellow line between points (170, 220) and (45, 212).
; PLAN: r0=170(x1), r1=220(y1), r2=45(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 220
LDI r2, 45
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
