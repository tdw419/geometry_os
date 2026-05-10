; DESCRIPTION: Draws a magenta line from (258, 231) to (493, 47).
; PLAN: r0=258(x1), r1=231(y1), r2=493(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 231
LDI r2, 493
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
