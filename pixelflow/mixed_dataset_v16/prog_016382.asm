; DESCRIPTION: Draws a magenta line from (52, 148) to (301, 69).
; PLAN: r0=52(x1), r1=148(y1), r2=301(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 148
LDI r2, 301
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
