; DESCRIPTION: Renders a magenta line between points (295, 102) and (389, 169).
; PLAN: r0=295(x1), r1=102(y1), r2=389(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 102
LDI r2, 389
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
