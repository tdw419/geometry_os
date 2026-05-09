; DESCRIPTION: Renders a magenta line between points (218, 17) and (160, 4).
; PLAN: r0=218(x1), r1=17(y1), r2=160(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 17
LDI r2, 160
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
