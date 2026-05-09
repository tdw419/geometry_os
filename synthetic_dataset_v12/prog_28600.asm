; DESCRIPTION: Draws a magenta line from (37, 231) to (148, 124).
; PLAN: r0=37(x1), r1=231(y1), r2=148(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 231
LDI r2, 148
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
