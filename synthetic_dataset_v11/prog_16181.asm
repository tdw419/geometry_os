; DESCRIPTION: Draws a magenta line from (97, 196) to (228, 145).
; PLAN: r0=97(x1), r1=196(y1), r2=228(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 196
LDI r2, 228
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
