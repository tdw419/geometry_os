; DESCRIPTION: Renders a magenta line between points (117, 204) and (226, 123).
; PLAN: r0=117(x1), r1=204(y1), r2=226(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 204
LDI r2, 226
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
