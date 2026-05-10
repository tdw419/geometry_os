; DESCRIPTION: Draws a magenta line from (418, 11) to (270, 72).
; PLAN: r0=418(x1), r1=11(y1), r2=270(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 11
LDI r2, 270
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
