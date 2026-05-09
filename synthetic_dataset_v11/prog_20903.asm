; DESCRIPTION: Renders a purple line between points (118, 27) and (220, 131).
; PLAN: r0=118(x1), r1=27(y1), r2=220(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 27
LDI r2, 220
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
