; DESCRIPTION: Renders a magenta line between points (189, 83) and (362, 216).
; PLAN: r0=189(x1), r1=83(y1), r2=362(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 83
LDI r2, 362
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
