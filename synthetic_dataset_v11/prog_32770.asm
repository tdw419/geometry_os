; DESCRIPTION: Draws a magenta line from (220, 107) to (147, 158).
; PLAN: r0=220(x1), r1=107(y1), r2=147(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 107
LDI r2, 147
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
