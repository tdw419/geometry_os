; DESCRIPTION: Renders a magenta line between points (232, 135) and (131, 247).
; PLAN: r0=232(x1), r1=135(y1), r2=131(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 135
LDI r2, 131
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
