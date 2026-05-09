; DESCRIPTION: Draws a magenta line from (350, 15) to (222, 176).
; PLAN: r0=350(x1), r1=15(y1), r2=222(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 15
LDI r2, 222
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
