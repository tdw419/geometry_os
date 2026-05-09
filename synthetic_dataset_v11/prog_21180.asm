; DESCRIPTION: Draws a purple line from (127, 148) to (102, 123).
; PLAN: r0=127(x1), r1=148(y1), r2=102(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 148
LDI r2, 102
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
