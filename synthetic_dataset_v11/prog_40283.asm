; DESCRIPTION: Draws a magenta line from (148, 183) to (27, 185).
; PLAN: r0=148(x1), r1=183(y1), r2=27(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 183
LDI r2, 27
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
