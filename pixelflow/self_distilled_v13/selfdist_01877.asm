; DESCRIPTION: Renders a magenta line segment connecting (354, 39) to (77, 106).
; PLAN: r0=354(x1), r1=39(y1), r2=77(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 39
LDI r2, 77
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
