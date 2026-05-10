; DESCRIPTION: Renders a magenta line between points (478, 31) and (333, 67).
; PLAN: r0=478(x1), r1=31(y1), r2=333(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 31
LDI r2, 333
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
