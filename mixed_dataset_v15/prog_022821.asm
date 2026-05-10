; DESCRIPTION: Draws a magenta line from (364, 217) to (241, 13).
; PLAN: r0=364(x1), r1=217(y1), r2=241(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 217
LDI r2, 241
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
