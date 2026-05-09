; DESCRIPTION: Draws a magenta line from (449, 208) to (181, 199).
; PLAN: r0=449(x1), r1=208(y1), r2=181(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 208
LDI r2, 181
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
