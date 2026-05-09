; DESCRIPTION: Renders a magenta line between points (388, 149) and (506, 49).
; PLAN: r0=388(x1), r1=149(y1), r2=506(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 149
LDI r2, 506
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
