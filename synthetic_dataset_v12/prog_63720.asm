; DESCRIPTION: Renders a magenta line between points (311, 236) and (183, 177).
; PLAN: r0=311(x1), r1=236(y1), r2=183(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 236
LDI r2, 183
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
