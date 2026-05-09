; DESCRIPTION: Draws a magenta line from (233, 148) to (127, 183).
; PLAN: r0=233(x1), r1=148(y1), r2=127(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 148
LDI r2, 127
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
