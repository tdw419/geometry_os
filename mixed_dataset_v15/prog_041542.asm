; DESCRIPTION: Renders a magenta line between points (18, 43) and (319, 112).
; PLAN: r0=18(x1), r1=43(y1), r2=319(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 43
LDI r2, 319
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
