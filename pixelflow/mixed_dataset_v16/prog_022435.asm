; DESCRIPTION: Renders a magenta line between points (334, 33) and (30, 4).
; PLAN: r0=334(x1), r1=33(y1), r2=30(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 33
LDI r2, 30
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
