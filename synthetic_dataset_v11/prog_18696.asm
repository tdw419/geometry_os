; DESCRIPTION: Renders a magenta line between points (107, 14) and (23, 92).
; PLAN: r0=107(x1), r1=14(y1), r2=23(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 14
LDI r2, 23
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
