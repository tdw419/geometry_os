; DESCRIPTION: Draws a magenta line from (279, 218) to (195, 10).
; PLAN: r0=279(x1), r1=218(y1), r2=195(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 218
LDI r2, 195
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
