; DESCRIPTION: Renders a magenta line between points (102, 219) and (237, 62).
; PLAN: r0=102(x1), r1=219(y1), r2=237(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 219
LDI r2, 237
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
