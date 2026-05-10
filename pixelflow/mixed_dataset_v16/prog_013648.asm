; DESCRIPTION: Draws a magenta line from (133, 238) to (403, 106).
; PLAN: r0=133(x1), r1=238(y1), r2=403(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 238
LDI r2, 403
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
