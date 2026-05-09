; DESCRIPTION: Draws a magenta line from (496, 211) to (241, 15).
; PLAN: r0=496(x1), r1=211(y1), r2=241(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 211
LDI r2, 241
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
