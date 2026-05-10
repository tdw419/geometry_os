; DESCRIPTION: Renders a magenta line between points (77, 180) and (415, 169).
; PLAN: r0=77(x1), r1=180(y1), r2=415(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 180
LDI r2, 415
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
