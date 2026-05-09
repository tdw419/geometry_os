; DESCRIPTION: Renders a magenta line between points (196, 172) and (95, 131).
; PLAN: r0=196(x1), r1=172(y1), r2=95(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 172
LDI r2, 95
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
