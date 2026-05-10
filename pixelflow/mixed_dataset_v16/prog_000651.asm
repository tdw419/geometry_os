; DESCRIPTION: Renders a magenta line segment connecting (341, 133) to (97, 171).
; PLAN: r0=341(x1), r1=133(y1), r2=97(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 133
LDI r2, 97
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
