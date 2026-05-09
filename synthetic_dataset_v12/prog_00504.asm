; DESCRIPTION: Draws a purple line from (177, 209) to (179, 216).
; PLAN: r0=177(x1), r1=209(y1), r2=179(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 209
LDI r2, 179
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
