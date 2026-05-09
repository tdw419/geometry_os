; DESCRIPTION: Draws a magenta line from (231, 72) to (205, 183).
; PLAN: r0=231(x1), r1=72(y1), r2=205(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 72
LDI r2, 205
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
