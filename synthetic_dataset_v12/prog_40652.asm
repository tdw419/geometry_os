; DESCRIPTION: Draws a magenta line from (198, 123) to (124, 62).
; PLAN: r0=198(x1), r1=123(y1), r2=124(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 123
LDI r2, 124
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
