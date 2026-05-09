; DESCRIPTION: Draws a magenta line from (246, 33) to (218, 175).
; PLAN: r0=246(x1), r1=33(y1), r2=218(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 33
LDI r2, 218
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
