; DESCRIPTION: Draws a yellow line from (68, 60) to (96, 72).
; PLAN: r0=68(x1), r1=60(y1), r2=96(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 60
LDI r2, 96
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
