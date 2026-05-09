; DESCRIPTION: Renders a magenta line between points (451, 126) and (178, 23).
; PLAN: r0=451(x1), r1=126(y1), r2=178(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 126
LDI r2, 178
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
