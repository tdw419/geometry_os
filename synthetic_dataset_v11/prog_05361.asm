; DESCRIPTION: Draws a yellow line from (102, 6) to (193, 132).
; PLAN: r0=102(x1), r1=6(y1), r2=193(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 6
LDI r2, 193
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
