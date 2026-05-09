; DESCRIPTION: Renders a purple line between points (230, 131) and (170, 117).
; PLAN: r0=230(x1), r1=131(y1), r2=170(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 131
LDI r2, 170
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
