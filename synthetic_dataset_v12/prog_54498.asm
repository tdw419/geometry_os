; DESCRIPTION: Draws a yellow line from (152, 75) to (3, 202).
; PLAN: r0=152(x1), r1=75(y1), r2=3(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 75
LDI r2, 3
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
