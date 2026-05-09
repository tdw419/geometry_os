; DESCRIPTION: Renders a magenta line between points (498, 226) and (278, 217).
; PLAN: r0=498(x1), r1=226(y1), r2=278(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 226
LDI r2, 278
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
