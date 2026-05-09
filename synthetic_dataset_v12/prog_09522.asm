; DESCRIPTION: Places a magenta line segment connecting (267, 190) to (344, 130).
; PLAN: r0=267(x1), r1=190(y1), r2=344(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 190
LDI r2, 344
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
