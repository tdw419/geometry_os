; DESCRIPTION: Draws a magenta line from (339, 63) to (46, 132).
; PLAN: r0=339(x1), r1=63(y1), r2=46(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 63
LDI r2, 46
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
