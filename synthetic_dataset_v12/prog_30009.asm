; DESCRIPTION: Draws a yellow line from (198, 149) to (364, 88).
; PLAN: r0=198(x1), r1=149(y1), r2=364(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 149
LDI r2, 364
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
