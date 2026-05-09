; DESCRIPTION: Draws a blue line from (263, 94) to (447, 83).
; PLAN: r0=263(x1), r1=94(y1), r2=447(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 94
LDI r2, 447
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
