; DESCRIPTION: Draws a magenta line from (342, 153) to (353, 198).
; PLAN: r0=342(x1), r1=153(y1), r2=353(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 153
LDI r2, 353
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
