; DESCRIPTION: Renders a magenta line between points (53, 189) and (364, 51).
; PLAN: r0=53(x1), r1=189(y1), r2=364(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 189
LDI r2, 364
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
