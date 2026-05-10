; DESCRIPTION: Draws a magenta line from (101, 194) to (377, 172).
; PLAN: r0=101(x1), r1=194(y1), r2=377(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 194
LDI r2, 377
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
