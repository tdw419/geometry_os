; DESCRIPTION: Renders a magenta line between points (250, 98) and (74, 61).
; PLAN: r0=250(x1), r1=98(y1), r2=74(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 98
LDI r2, 74
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
