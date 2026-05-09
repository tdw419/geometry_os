; DESCRIPTION: Draws a magenta line from (195, 22) to (150, 72).
; PLAN: r0=195(x1), r1=22(y1), r2=150(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 22
LDI r2, 150
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
