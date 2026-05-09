; DESCRIPTION: Draws a purple line from (107, 179) to (33, 177).
; PLAN: r0=107(x1), r1=179(y1), r2=33(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 179
LDI r2, 33
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
