; DESCRIPTION: Renders a magenta line between points (307, 190) and (194, 200).
; PLAN: r0=307(x1), r1=190(y1), r2=194(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 190
LDI r2, 194
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
