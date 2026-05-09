; DESCRIPTION: Draws a magenta line from (30, 77) to (259, 99).
; PLAN: r0=30(x1), r1=77(y1), r2=259(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 77
LDI r2, 259
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
