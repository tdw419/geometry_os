; DESCRIPTION: Renders a magenta line between points (181, 19) and (94, 21).
; PLAN: r0=181(x1), r1=19(y1), r2=94(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 19
LDI r2, 94
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
