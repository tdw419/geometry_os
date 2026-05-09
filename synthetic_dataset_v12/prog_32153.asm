; DESCRIPTION: Draws a magenta line from (455, 158) to (305, 189).
; PLAN: r0=455(x1), r1=158(y1), r2=305(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 158
LDI r2, 305
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
