; DESCRIPTION: Draws a magenta line from (93, 121) to (58, 206).
; PLAN: r0=93(x1), r1=121(y1), r2=58(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 121
LDI r2, 58
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
