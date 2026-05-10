; DESCRIPTION: Renders a blue line between points (80, 228) and (112, 177).
; PLAN: r0=80(x1), r1=228(y1), r2=112(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 228
LDI r2, 112
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
