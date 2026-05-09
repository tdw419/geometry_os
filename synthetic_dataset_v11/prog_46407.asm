; DESCRIPTION: Renders a magenta line between points (89, 60) and (53, 177).
; PLAN: r0=89(x1), r1=60(y1), r2=53(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 60
LDI r2, 53
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
