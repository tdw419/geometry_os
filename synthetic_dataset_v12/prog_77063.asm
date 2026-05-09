; DESCRIPTION: Renders a magenta line between points (481, 163) and (297, 52).
; PLAN: r0=481(x1), r1=163(y1), r2=297(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 163
LDI r2, 297
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
