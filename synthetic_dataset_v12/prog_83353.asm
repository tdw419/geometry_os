; DESCRIPTION: Renders a magenta line between points (315, 47) and (244, 190).
; PLAN: r0=315(x1), r1=47(y1), r2=244(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 47
LDI r2, 244
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
