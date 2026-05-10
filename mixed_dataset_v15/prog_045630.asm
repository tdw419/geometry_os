; DESCRIPTION: Draws a magenta line from (9, 99) to (331, 20).
; PLAN: r0=9(x1), r1=99(y1), r2=331(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 99
LDI r2, 331
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
