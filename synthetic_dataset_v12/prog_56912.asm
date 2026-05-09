; DESCRIPTION: Draws a magenta line from (385, 124) to (447, 64).
; PLAN: r0=385(x1), r1=124(y1), r2=447(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 124
LDI r2, 447
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
