; DESCRIPTION: Draws a black line from (49, 123) to (440, 4).
; PLAN: r0=49(x1), r1=123(y1), r2=440(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 123
LDI r2, 440
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
