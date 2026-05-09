; DESCRIPTION: Renders a magenta line between points (56, 65) and (60, 11).
; PLAN: r0=56(x1), r1=65(y1), r2=60(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 65
LDI r2, 60
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
