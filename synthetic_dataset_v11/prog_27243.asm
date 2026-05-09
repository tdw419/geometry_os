; DESCRIPTION: Places a magenta line segment connecting (221, 251) to (58, 198).
; PLAN: r0=221(x1), r1=251(y1), r2=58(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 251
LDI r2, 58
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
