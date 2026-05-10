; DESCRIPTION: Renders a red line between points (123, 198) and (1, 225).
; PLAN: r0=123(x1), r1=198(y1), r2=1(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 198
LDI r2, 1
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
