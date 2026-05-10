; DESCRIPTION: Renders a yellow line between points (430, 141) and (423, 146).
; PLAN: r0=430(x1), r1=141(y1), r2=423(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 141
LDI r2, 423
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
