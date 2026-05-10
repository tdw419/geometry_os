; DESCRIPTION: Renders a magenta line between points (90, 72) and (457, 120).
; PLAN: r0=90(x1), r1=72(y1), r2=457(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 72
LDI r2, 457
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
