; DESCRIPTION: Draws a yellow line from (154, 169) to (37, 40).
; PLAN: r0=154(x1), r1=169(y1), r2=37(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 169
LDI r2, 37
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
