; DESCRIPTION: Draws a yellow line from (3, 28) to (21, 148).
; PLAN: r0=3(x1), r1=28(y1), r2=21(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 21
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
