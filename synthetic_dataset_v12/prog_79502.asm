; DESCRIPTION: Renders a magenta line between points (131, 198) and (129, 26).
; PLAN: r0=131(x1), r1=198(y1), r2=129(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 198
LDI r2, 129
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
