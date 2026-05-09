; DESCRIPTION: Draws a magenta line from (133, 153) to (241, 113).
; PLAN: r0=133(x1), r1=153(y1), r2=241(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 153
LDI r2, 241
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
