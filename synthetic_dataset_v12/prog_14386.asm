; DESCRIPTION: Draws a magenta line from (202, 198) to (266, 128).
; PLAN: r0=202(x1), r1=198(y1), r2=266(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 198
LDI r2, 266
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
