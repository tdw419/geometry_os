; DESCRIPTION: Renders a magenta line between points (131, 82) and (421, 216).
; PLAN: r0=131(x1), r1=82(y1), r2=421(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 82
LDI r2, 421
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
