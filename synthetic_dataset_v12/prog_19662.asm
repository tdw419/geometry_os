; DESCRIPTION: Renders a magenta line between points (486, 23) and (94, 156).
; PLAN: r0=486(x1), r1=23(y1), r2=94(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 23
LDI r2, 94
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
