; DESCRIPTION: Draws a yellow line from (440, 188) to (395, 198).
; PLAN: r0=440(x1), r1=188(y1), r2=395(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 188
LDI r2, 395
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
