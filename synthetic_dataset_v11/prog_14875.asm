; DESCRIPTION: Draws a yellow line from (9, 56) to (247, 79).
; PLAN: r0=9(x1), r1=56(y1), r2=247(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 56
LDI r2, 247
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
