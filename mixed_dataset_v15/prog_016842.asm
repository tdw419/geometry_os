; DESCRIPTION: Renders a magenta line segment connecting (74, 61) to (372, 170).
; PLAN: r0=74(x1), r1=61(y1), r2=372(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 61
LDI r2, 372
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
