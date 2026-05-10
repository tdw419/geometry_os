; DESCRIPTION: Draws a yellow line from (484, 150) to (152, 231).
; PLAN: r0=484(x1), r1=150(y1), r2=152(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 150
LDI r2, 152
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
