; DESCRIPTION: Renders a magenta line between points (238, 124) and (193, 66).
; PLAN: r0=238(x1), r1=124(y1), r2=193(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 124
LDI r2, 193
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
