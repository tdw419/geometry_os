; DESCRIPTION: Renders a magenta line between points (421, 153) and (139, 61).
; PLAN: r0=421(x1), r1=153(y1), r2=139(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 153
LDI r2, 139
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
