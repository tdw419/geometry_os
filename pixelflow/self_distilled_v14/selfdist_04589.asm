; DESCRIPTION: Renders a magenta line segment connecting (43, 61) to (247, 19).
; PLAN: r0=43(x1), r1=61(y1), r2=247(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 61
LDI r2, 247
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
