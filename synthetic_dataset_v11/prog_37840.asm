; DESCRIPTION: Renders a magenta line between points (64, 163) and (135, 77).
; PLAN: r0=64(x1), r1=163(y1), r2=135(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 163
LDI r2, 135
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
