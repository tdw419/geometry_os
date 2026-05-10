; DESCRIPTION: Draws a magenta line from (426, 19) to (432, 61).
; PLAN: r0=426(x1), r1=19(y1), r2=432(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 19
LDI r2, 432
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
