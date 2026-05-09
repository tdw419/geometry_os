; DESCRIPTION: Draws a magenta line from (248, 182) to (276, 110).
; PLAN: r0=248(x1), r1=182(y1), r2=276(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 182
LDI r2, 276
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
