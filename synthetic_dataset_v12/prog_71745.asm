; DESCRIPTION: Draws a yellow line from (388, 102) to (175, 10).
; PLAN: r0=388(x1), r1=102(y1), r2=175(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 102
LDI r2, 175
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
