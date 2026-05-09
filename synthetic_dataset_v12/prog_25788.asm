; DESCRIPTION: Renders a magenta line between points (468, 72) and (316, 130).
; PLAN: r0=468(x1), r1=72(y1), r2=316(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 72
LDI r2, 316
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
