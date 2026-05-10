; DESCRIPTION: Draws a yellow line from (32, 162) to (3, 90).
; PLAN: r0=32(x1), r1=162(y1), r2=3(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 162
LDI r2, 3
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
