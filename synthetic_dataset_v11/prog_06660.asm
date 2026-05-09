; DESCRIPTION: Draws a yellow line from (152, 6) to (34, 119).
; PLAN: r0=152(x1), r1=6(y1), r2=34(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 6
LDI r2, 34
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
