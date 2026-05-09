; DESCRIPTION: Draws a yellow line from (14, 81) to (288, 231).
; PLAN: r0=14(x1), r1=81(y1), r2=288(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 81
LDI r2, 288
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
