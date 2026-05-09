; DESCRIPTION: Renders a magenta line between points (65, 57) and (219, 13).
; PLAN: r0=65(x1), r1=57(y1), r2=219(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 57
LDI r2, 219
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
