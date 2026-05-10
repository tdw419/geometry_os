; DESCRIPTION: Renders a magenta line between points (94, 47) and (78, 103).
; PLAN: r0=94(x1), r1=47(y1), r2=78(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 47
LDI r2, 78
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
