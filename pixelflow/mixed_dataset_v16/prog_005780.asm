; DESCRIPTION: Renders a magenta line between points (170, 207) and (2, 233).
; PLAN: r0=170(x1), r1=207(y1), r2=2(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 207
LDI r2, 2
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
