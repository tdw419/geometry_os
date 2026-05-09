; DESCRIPTION: Renders a purple line between points (127, 13) and (162, 131).
; PLAN: r0=127(x1), r1=13(y1), r2=162(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 13
LDI r2, 162
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
