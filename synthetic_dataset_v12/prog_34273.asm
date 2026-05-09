; DESCRIPTION: Draws a yellow line from (193, 92) to (101, 66).
; PLAN: r0=193(x1), r1=92(y1), r2=101(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 92
LDI r2, 101
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
