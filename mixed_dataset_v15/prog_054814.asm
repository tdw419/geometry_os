; DESCRIPTION: Renders a magenta line between points (56, 151) and (251, 180).
; PLAN: r0=56(x1), r1=151(y1), r2=251(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 151
LDI r2, 251
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
