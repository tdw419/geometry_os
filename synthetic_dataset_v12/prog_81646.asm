; DESCRIPTION: Renders a purple line between points (222, 23) and (372, 146).
; PLAN: r0=222(x1), r1=23(y1), r2=372(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 23
LDI r2, 372
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
