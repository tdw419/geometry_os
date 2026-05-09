; DESCRIPTION: Draws a yellow line from (20, 105) to (254, 98).
; PLAN: r0=20(x1), r1=105(y1), r2=254(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 105
LDI r2, 254
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
