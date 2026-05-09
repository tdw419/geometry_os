; DESCRIPTION: Draws a magenta line from (142, 104) to (285, 3).
; PLAN: r0=142(x1), r1=104(y1), r2=285(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 104
LDI r2, 285
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
