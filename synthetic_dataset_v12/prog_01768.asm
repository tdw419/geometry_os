; DESCRIPTION: Renders a magenta line between points (99, 108) and (80, 180).
; PLAN: r0=99(x1), r1=108(y1), r2=80(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 108
LDI r2, 80
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
