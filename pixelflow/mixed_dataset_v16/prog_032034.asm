; DESCRIPTION: Renders a yellow line between points (35, 58) and (277, 97).
; PLAN: r0=35(x1), r1=58(y1), r2=277(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 58
LDI r2, 277
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
