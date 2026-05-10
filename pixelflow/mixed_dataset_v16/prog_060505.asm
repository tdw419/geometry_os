; DESCRIPTION: Renders a magenta line between points (39, 94) and (116, 40).
; PLAN: r0=39(x1), r1=94(y1), r2=116(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 94
LDI r2, 116
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
