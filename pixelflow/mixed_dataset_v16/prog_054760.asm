; DESCRIPTION: Renders a magenta line between points (273, 195) and (11, 112).
; PLAN: r0=273(x1), r1=195(y1), r2=11(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 195
LDI r2, 11
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
