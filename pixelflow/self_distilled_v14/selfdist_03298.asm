; DESCRIPTION: Draws a magenta line from (51, 129) to (148, 58).
; PLAN: r0=51(x1), r1=129(y1), r2=148(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 129
LDI r2, 148
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
