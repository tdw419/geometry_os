; DESCRIPTION: Draws a magenta line from (441, 36) to (378, 48).
; PLAN: r0=441(x1), r1=36(y1), r2=378(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 36
LDI r2, 378
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
