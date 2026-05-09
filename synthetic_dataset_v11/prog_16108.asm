; DESCRIPTION: Renders a magenta line between points (193, 60) and (226, 150).
; PLAN: r0=193(x1), r1=60(y1), r2=226(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 60
LDI r2, 226
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
