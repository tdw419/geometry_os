; DESCRIPTION: Draws a magenta line from (266, 249) to (304, 92).
; PLAN: r0=266(x1), r1=249(y1), r2=304(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 249
LDI r2, 304
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
