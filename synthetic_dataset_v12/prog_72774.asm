; DESCRIPTION: Places a magenta line segment connecting (156, 182) to (316, 202).
; PLAN: r0=156(x1), r1=182(y1), r2=316(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 182
LDI r2, 316
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
