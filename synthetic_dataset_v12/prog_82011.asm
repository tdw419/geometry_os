; DESCRIPTION: Renders a magenta line between points (110, 177) and (195, 194).
; PLAN: r0=110(x1), r1=177(y1), r2=195(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 177
LDI r2, 195
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
