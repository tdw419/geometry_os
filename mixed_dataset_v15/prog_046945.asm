; DESCRIPTION: Renders a magenta line between points (115, 240) and (291, 205).
; PLAN: r0=115(x1), r1=240(y1), r2=291(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 240
LDI r2, 291
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
