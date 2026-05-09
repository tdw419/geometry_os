; DESCRIPTION: Draws a magenta line from (119, 58) to (13, 233).
; PLAN: r0=119(x1), r1=58(y1), r2=13(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 58
LDI r2, 13
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
