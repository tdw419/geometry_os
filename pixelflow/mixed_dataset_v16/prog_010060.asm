; DESCRIPTION: Draws a yellow line from (260, 138) to (56, 47).
; PLAN: r0=260(x1), r1=138(y1), r2=56(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 138
LDI r2, 56
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
