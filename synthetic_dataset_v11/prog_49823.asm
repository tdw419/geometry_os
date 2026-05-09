; DESCRIPTION: Draws a yellow line from (75, 96) to (54, 152).
; PLAN: r0=75(x1), r1=96(y1), r2=54(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 96
LDI r2, 54
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
