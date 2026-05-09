; DESCRIPTION: Draws a magenta line from (178, 201) to (499, 65).
; PLAN: r0=178(x1), r1=201(y1), r2=499(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 201
LDI r2, 499
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
