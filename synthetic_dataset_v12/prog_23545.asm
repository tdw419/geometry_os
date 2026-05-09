; DESCRIPTION: Draws a magenta line from (238, 135) to (381, 208).
; PLAN: r0=238(x1), r1=135(y1), r2=381(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 135
LDI r2, 381
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
