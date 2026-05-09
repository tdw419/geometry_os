; DESCRIPTION: Draws a magenta line from (327, 218) to (424, 115).
; PLAN: r0=327(x1), r1=218(y1), r2=424(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 218
LDI r2, 424
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
