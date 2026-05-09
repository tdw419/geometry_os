; DESCRIPTION: Renders a yellow line between points (114, 216) and (150, 220).
; PLAN: r0=114(x1), r1=216(y1), r2=150(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 216
LDI r2, 150
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
