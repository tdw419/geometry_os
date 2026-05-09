; DESCRIPTION: Renders a magenta line between points (123, 219) and (220, 217).
; PLAN: r0=123(x1), r1=219(y1), r2=220(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 219
LDI r2, 220
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
