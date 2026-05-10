; DESCRIPTION: Draws a yellow line from (388, 3) to (90, 99).
; PLAN: r0=388(x1), r1=3(y1), r2=90(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 3
LDI r2, 90
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
