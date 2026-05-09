; DESCRIPTION: Renders a magenta line between points (113, 45) and (78, 141).
; PLAN: r0=113(x1), r1=45(y1), r2=78(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 45
LDI r2, 78
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
