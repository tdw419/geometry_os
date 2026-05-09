; DESCRIPTION: Renders a magenta line between points (177, 230) and (126, 211).
; PLAN: r0=177(x1), r1=230(y1), r2=126(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 230
LDI r2, 126
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
