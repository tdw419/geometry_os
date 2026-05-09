; DESCRIPTION: Draws a magenta line from (463, 34) to (194, 37).
; PLAN: r0=463(x1), r1=34(y1), r2=194(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 34
LDI r2, 194
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
