; DESCRIPTION: Draws a magenta line from (123, 208) to (51, 183).
; PLAN: r0=123(x1), r1=208(y1), r2=51(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 208
LDI r2, 51
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
