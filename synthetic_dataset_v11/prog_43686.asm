; DESCRIPTION: Draws a magenta line from (219, 241) to (248, 56).
; PLAN: r0=219(x1), r1=241(y1), r2=248(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 241
LDI r2, 248
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
