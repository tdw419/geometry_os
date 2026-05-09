; DESCRIPTION: Renders a purple line between points (131, 207) and (23, 109).
; PLAN: r0=131(x1), r1=207(y1), r2=23(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 207
LDI r2, 23
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
