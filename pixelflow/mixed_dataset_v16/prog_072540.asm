; DESCRIPTION: Draws a magenta line from (379, 58) to (378, 177).
; PLAN: r0=379(x1), r1=58(y1), r2=378(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 58
LDI r2, 378
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
