; DESCRIPTION: Renders a magenta line between points (222, 53) and (90, 115).
; PLAN: r0=222(x1), r1=53(y1), r2=90(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 53
LDI r2, 90
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
