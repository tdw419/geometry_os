; DESCRIPTION: Draws a magenta line from (368, 88) to (403, 97).
; PLAN: r0=368(x1), r1=88(y1), r2=403(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 88
LDI r2, 403
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
