; DESCRIPTION: Renders a magenta line between points (28, 35) and (181, 36).
; PLAN: r0=28(x1), r1=35(y1), r2=181(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 35
LDI r2, 181
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
