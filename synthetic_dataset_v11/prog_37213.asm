; DESCRIPTION: Draws a magenta line from (156, 36) to (231, 94).
; PLAN: r0=156(x1), r1=36(y1), r2=231(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 36
LDI r2, 231
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
