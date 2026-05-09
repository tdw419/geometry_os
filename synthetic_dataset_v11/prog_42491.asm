; DESCRIPTION: Renders a magenta line between points (72, 39) and (102, 78).
; PLAN: r0=72(x1), r1=39(y1), r2=102(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 39
LDI r2, 102
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
