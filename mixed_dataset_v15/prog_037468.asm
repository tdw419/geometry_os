; DESCRIPTION: Draws a yellow line from (104, 222) to (461, 110).
; PLAN: r0=104(x1), r1=222(y1), r2=461(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 222
LDI r2, 461
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
