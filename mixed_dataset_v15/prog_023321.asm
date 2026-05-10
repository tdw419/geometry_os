; DESCRIPTION: Renders a magenta line between points (451, 99) and (504, 154).
; PLAN: r0=451(x1), r1=99(y1), r2=504(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 99
LDI r2, 504
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
