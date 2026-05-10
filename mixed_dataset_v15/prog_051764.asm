; DESCRIPTION: Draws a magenta line from (325, 53) to (343, 18).
; PLAN: r0=325(x1), r1=53(y1), r2=343(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 53
LDI r2, 343
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
