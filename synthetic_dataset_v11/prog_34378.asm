; DESCRIPTION: Draws a yellow line from (62, 34) to (196, 75).
; PLAN: r0=62(x1), r1=34(y1), r2=196(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 34
LDI r2, 196
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
