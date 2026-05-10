; DESCRIPTION: Draws a purple line from (175, 47) to (440, 147).
; PLAN: r0=175(x1), r1=47(y1), r2=440(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 47
LDI r2, 440
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
