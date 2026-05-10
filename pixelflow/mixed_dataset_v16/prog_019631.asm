; DESCRIPTION: Draws a magenta line from (231, 198) to (177, 64).
; PLAN: r0=231(x1), r1=198(y1), r2=177(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 198
LDI r2, 177
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
