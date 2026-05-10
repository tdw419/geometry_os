; DESCRIPTION: Renders a magenta line between points (172, 127) and (409, 99).
; PLAN: r0=172(x1), r1=127(y1), r2=409(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 127
LDI r2, 409
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
