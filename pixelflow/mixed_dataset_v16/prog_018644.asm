; DESCRIPTION: Draws a magenta line from (285, 104) to (334, 101).
; PLAN: r0=285(x1), r1=104(y1), r2=334(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 104
LDI r2, 334
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
