; DESCRIPTION: Draws a magenta line from (224, 201) to (79, 155).
; PLAN: r0=224(x1), r1=201(y1), r2=79(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 201
LDI r2, 79
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
