; DESCRIPTION: Draws a yellow line from (66, 172) to (343, 92).
; PLAN: r0=66(x1), r1=172(y1), r2=343(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 172
LDI r2, 343
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
