; DESCRIPTION: Places a magenta line segment connecting (92, 225) to (141, 202).
; PLAN: r0=92(x1), r1=225(y1), r2=141(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 225
LDI r2, 141
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
