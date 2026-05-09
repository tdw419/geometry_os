; DESCRIPTION: Renders a magenta line between points (331, 78) and (324, 14).
; PLAN: r0=331(x1), r1=78(y1), r2=324(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 78
LDI r2, 324
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
