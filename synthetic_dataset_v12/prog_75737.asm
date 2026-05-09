; DESCRIPTION: Renders a magenta line between points (286, 113) and (221, 169).
; PLAN: r0=286(x1), r1=113(y1), r2=221(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 113
LDI r2, 221
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
