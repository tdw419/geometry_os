; DESCRIPTION: Draws a yellow line from (69, 211) to (58, 169).
; PLAN: r0=69(x1), r1=211(y1), r2=58(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 211
LDI r2, 58
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
