; DESCRIPTION: Draws a magenta line from (39, 137) to (390, 208).
; PLAN: r0=39(x1), r1=137(y1), r2=390(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 137
LDI r2, 390
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
