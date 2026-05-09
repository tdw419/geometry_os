; DESCRIPTION: Renders a purple line between points (164, 46) and (57, 6).
; PLAN: r0=164(x1), r1=46(y1), r2=57(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 46
LDI r2, 57
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
