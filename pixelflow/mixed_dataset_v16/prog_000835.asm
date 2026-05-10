; DESCRIPTION: Draws a magenta line from (71, 246) to (233, 26).
; PLAN: r0=71(x1), r1=246(y1), r2=233(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 246
LDI r2, 233
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
