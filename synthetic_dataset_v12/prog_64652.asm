; DESCRIPTION: Renders a magenta line between points (219, 189) and (506, 109).
; PLAN: r0=219(x1), r1=189(y1), r2=506(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 189
LDI r2, 506
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
