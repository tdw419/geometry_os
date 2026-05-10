; DESCRIPTION: Renders a magenta line segment connecting (256, 146) to (322, 118).
; PLAN: r0=256(x1), r1=146(y1), r2=322(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 146
LDI r2, 322
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
