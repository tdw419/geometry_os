; DESCRIPTION: Renders a magenta line between points (98, 7) and (78, 57).
; PLAN: r0=98(x1), r1=7(y1), r2=78(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 7
LDI r2, 78
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
