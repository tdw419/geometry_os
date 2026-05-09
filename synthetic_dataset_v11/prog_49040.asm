; DESCRIPTION: Draws a magenta line from (217, 1) to (238, 206).
; PLAN: r0=217(x1), r1=1(y1), r2=238(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 1
LDI r2, 238
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
