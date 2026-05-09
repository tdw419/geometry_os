; DESCRIPTION: Draws a magenta line from (124, 251) to (126, 66).
; PLAN: r0=124(x1), r1=251(y1), r2=126(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 251
LDI r2, 126
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
