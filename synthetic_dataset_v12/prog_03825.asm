; DESCRIPTION: Draws a magenta line from (148, 238) to (263, 97).
; PLAN: r0=148(x1), r1=238(y1), r2=263(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 238
LDI r2, 263
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
