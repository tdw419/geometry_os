; DESCRIPTION: Draws a magenta line from (129, 202) to (193, 99).
; PLAN: r0=129(x1), r1=202(y1), r2=193(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 202
LDI r2, 193
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
