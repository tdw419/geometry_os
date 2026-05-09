; DESCRIPTION: Draws a purple line from (21, 124) to (311, 64).
; PLAN: r0=21(x1), r1=124(y1), r2=311(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 124
LDI r2, 311
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
