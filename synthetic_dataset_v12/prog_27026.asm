; DESCRIPTION: Renders a magenta line between points (247, 84) and (193, 98).
; PLAN: r0=247(x1), r1=84(y1), r2=193(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 84
LDI r2, 193
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
