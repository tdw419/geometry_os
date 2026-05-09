; DESCRIPTION: Draws a magenta line from (249, 231) to (342, 88).
; PLAN: r0=249(x1), r1=231(y1), r2=342(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 231
LDI r2, 342
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
