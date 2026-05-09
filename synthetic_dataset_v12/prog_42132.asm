; DESCRIPTION: Places a magenta line segment connecting (468, 212) to (276, 143).
; PLAN: r0=468(x1), r1=212(y1), r2=276(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 212
LDI r2, 276
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
