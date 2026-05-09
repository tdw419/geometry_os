; DESCRIPTION: Draws a yellow line from (0, 144) to (124, 145).
; PLAN: r0=0(x1), r1=144(y1), r2=124(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 144
LDI r2, 124
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
