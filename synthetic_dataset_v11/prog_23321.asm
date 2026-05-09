; DESCRIPTION: Draws a yellow line from (25, 42) to (201, 80).
; PLAN: r0=25(x1), r1=42(y1), r2=201(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 42
LDI r2, 201
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
