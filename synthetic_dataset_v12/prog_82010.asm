; DESCRIPTION: Renders a purple line between points (277, 187) and (290, 94).
; PLAN: r0=277(x1), r1=187(y1), r2=290(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 187
LDI r2, 290
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
