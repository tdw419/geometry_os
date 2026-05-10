; DESCRIPTION: Renders a magenta line segment connecting (135, 146) to (399, 22).
; PLAN: r0=135(x1), r1=146(y1), r2=399(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 146
LDI r2, 399
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
