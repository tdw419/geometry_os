; DESCRIPTION: Renders a yellow line between points (430, 35) and (337, 241).
; PLAN: r0=430(x1), r1=35(y1), r2=337(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 35
LDI r2, 337
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
