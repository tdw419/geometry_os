; DESCRIPTION: Draws a magenta line from (222, 225) to (211, 63).
; PLAN: r0=222(x1), r1=225(y1), r2=211(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 225
LDI r2, 211
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
