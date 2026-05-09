; DESCRIPTION: Draws a yellow line from (44, 138) to (110, 129).
; PLAN: r0=44(x1), r1=138(y1), r2=110(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 138
LDI r2, 110
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
