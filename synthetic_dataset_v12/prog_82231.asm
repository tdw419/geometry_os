; DESCRIPTION: Renders a magenta line between points (47, 74) and (256, 149).
; PLAN: r0=47(x1), r1=74(y1), r2=256(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 74
LDI r2, 256
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
