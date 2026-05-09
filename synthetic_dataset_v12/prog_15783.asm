; DESCRIPTION: Draws a magenta line from (414, 190) to (120, 248).
; PLAN: r0=414(x1), r1=190(y1), r2=120(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 190
LDI r2, 120
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
