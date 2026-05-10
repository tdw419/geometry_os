; DESCRIPTION: Renders a magenta line between points (14, 90) and (95, 190).
; PLAN: r0=14(x1), r1=90(y1), r2=95(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 90
LDI r2, 95
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
