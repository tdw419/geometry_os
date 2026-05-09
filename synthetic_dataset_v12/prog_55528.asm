; DESCRIPTION: Renders a magenta line between points (419, 55) and (505, 97).
; PLAN: r0=419(x1), r1=55(y1), r2=505(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 55
LDI r2, 505
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
