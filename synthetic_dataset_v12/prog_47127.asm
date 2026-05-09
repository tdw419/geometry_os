; DESCRIPTION: Renders a magenta line between points (353, 190) and (78, 67).
; PLAN: r0=353(x1), r1=190(y1), r2=78(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 190
LDI r2, 78
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
