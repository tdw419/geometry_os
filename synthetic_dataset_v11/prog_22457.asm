; DESCRIPTION: Renders a magenta line between points (196, 87) and (193, 80).
; PLAN: r0=196(x1), r1=87(y1), r2=193(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 87
LDI r2, 193
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
