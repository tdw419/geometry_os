; DESCRIPTION: Renders a magenta line between points (471, 229) and (31, 29).
; PLAN: r0=471(x1), r1=229(y1), r2=31(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 229
LDI r2, 31
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
