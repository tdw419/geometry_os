; DESCRIPTION: Draws a magenta line from (372, 162) to (241, 11).
; PLAN: r0=372(x1), r1=162(y1), r2=241(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 162
LDI r2, 241
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
