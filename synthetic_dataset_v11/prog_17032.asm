; DESCRIPTION: Draws a magenta line from (112, 86) to (94, 57).
; PLAN: r0=112(x1), r1=86(y1), r2=94(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 86
LDI r2, 94
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
