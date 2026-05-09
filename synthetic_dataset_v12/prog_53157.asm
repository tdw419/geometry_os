; DESCRIPTION: Draws a magenta line from (439, 201) to (497, 220).
; PLAN: r0=439(x1), r1=201(y1), r2=497(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 201
LDI r2, 497
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
