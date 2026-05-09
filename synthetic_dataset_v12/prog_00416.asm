; DESCRIPTION: Draws a yellow line from (311, 202) to (440, 201).
; PLAN: r0=311(x1), r1=202(y1), r2=440(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 202
LDI r2, 440
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
