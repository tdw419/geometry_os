; DESCRIPTION: Draws a magenta line from (417, 177) to (95, 138).
; PLAN: r0=417(x1), r1=177(y1), r2=95(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 177
LDI r2, 95
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
