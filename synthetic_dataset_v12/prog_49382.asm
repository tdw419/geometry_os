; DESCRIPTION: Draws a orange line from (175, 162) to (17, 20).
; PLAN: r0=175(x1), r1=162(y1), r2=17(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 162
LDI r2, 17
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
