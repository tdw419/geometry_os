; DESCRIPTION: Draws a magenta line from (428, 232) to (383, 208).
; PLAN: r0=428(x1), r1=232(y1), r2=383(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 232
LDI r2, 383
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
