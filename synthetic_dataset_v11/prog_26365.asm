; DESCRIPTION: Renders a magenta line between points (112, 127) and (36, 86).
; PLAN: r0=112(x1), r1=127(y1), r2=36(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 127
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
