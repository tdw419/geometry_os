; DESCRIPTION: Draws a magenta line from (66, 18) to (129, 208).
; PLAN: r0=66(x1), r1=18(y1), r2=129(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 18
LDI r2, 129
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
