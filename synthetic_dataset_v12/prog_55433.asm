; DESCRIPTION: Renders a magenta line between points (439, 23) and (193, 226).
; PLAN: r0=439(x1), r1=23(y1), r2=193(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 23
LDI r2, 193
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
