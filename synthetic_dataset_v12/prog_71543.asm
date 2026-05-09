; DESCRIPTION: Renders a magenta line between points (261, 55) and (86, 131).
; PLAN: r0=261(x1), r1=55(y1), r2=86(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 55
LDI r2, 86
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
