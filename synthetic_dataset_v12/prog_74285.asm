; DESCRIPTION: Renders a magenta line between points (102, 236) and (92, 158).
; PLAN: r0=102(x1), r1=236(y1), r2=92(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 236
LDI r2, 92
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
