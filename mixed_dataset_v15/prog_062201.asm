; DESCRIPTION: Renders a magenta line between points (468, 233) and (372, 78).
; PLAN: r0=468(x1), r1=233(y1), r2=372(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 233
LDI r2, 372
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
