; DESCRIPTION: Renders a magenta line between points (378, 86) and (506, 28).
; PLAN: r0=378(x1), r1=86(y1), r2=506(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 86
LDI r2, 506
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
