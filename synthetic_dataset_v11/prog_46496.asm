; DESCRIPTION: Draws a magenta line from (80, 133) to (246, 241).
; PLAN: r0=80(x1), r1=133(y1), r2=246(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 133
LDI r2, 246
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
