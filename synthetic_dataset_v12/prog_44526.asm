; DESCRIPTION: Draws a magenta line from (388, 5) to (106, 241).
; PLAN: r0=388(x1), r1=5(y1), r2=106(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 5
LDI r2, 106
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
