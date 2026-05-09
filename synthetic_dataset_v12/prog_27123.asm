; DESCRIPTION: Renders a magenta line between points (185, 199) and (199, 117).
; PLAN: r0=185(x1), r1=199(y1), r2=199(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 199
LDI r2, 199
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
