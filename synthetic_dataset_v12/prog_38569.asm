; DESCRIPTION: Renders a magenta line between points (169, 236) and (11, 204).
; PLAN: r0=169(x1), r1=236(y1), r2=11(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 236
LDI r2, 11
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
