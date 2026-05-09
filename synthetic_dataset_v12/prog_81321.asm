; DESCRIPTION: Renders a magenta line between points (190, 189) and (468, 21).
; PLAN: r0=190(x1), r1=189(y1), r2=468(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 189
LDI r2, 468
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
