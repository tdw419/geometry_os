; DESCRIPTION: Renders a magenta line between points (319, 106) and (174, 17).
; PLAN: r0=319(x1), r1=106(y1), r2=174(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 106
LDI r2, 174
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
