; DESCRIPTION: Renders a magenta line between points (356, 135) and (341, 13).
; PLAN: r0=356(x1), r1=135(y1), r2=341(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 135
LDI r2, 341
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
