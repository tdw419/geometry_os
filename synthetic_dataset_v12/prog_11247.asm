; DESCRIPTION: Draws a magenta line from (31, 0) to (441, 7).
; PLAN: r0=31(x1), r1=0(y1), r2=441(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 0
LDI r2, 441
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
