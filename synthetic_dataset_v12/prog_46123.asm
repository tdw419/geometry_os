; DESCRIPTION: Renders a magenta line between points (110, 199) and (25, 59).
; PLAN: r0=110(x1), r1=199(y1), r2=25(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 199
LDI r2, 25
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
