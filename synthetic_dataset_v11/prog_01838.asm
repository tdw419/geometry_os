; DESCRIPTION: Renders a magenta line between points (177, 86) and (211, 151).
; PLAN: r0=177(x1), r1=86(y1), r2=211(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 86
LDI r2, 211
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
