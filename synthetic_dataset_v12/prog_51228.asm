; DESCRIPTION: Draws a magenta line from (314, 196) to (248, 64).
; PLAN: r0=314(x1), r1=196(y1), r2=248(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 196
LDI r2, 248
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
