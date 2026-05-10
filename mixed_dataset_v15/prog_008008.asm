; DESCRIPTION: Draws a yellow line from (29, 75) to (61, 160).
; PLAN: r0=29(x1), r1=75(y1), r2=61(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 75
LDI r2, 61
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
