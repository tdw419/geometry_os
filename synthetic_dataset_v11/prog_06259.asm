; DESCRIPTION: Draws a black line from (72, 158) to (222, 215).
; PLAN: r0=72(x1), r1=158(y1), r2=222(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 158
LDI r2, 222
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
