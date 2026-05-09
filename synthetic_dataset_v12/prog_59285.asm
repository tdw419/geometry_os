; DESCRIPTION: Draws a black line from (84, 135) to (162, 205).
; PLAN: r0=84(x1), r1=135(y1), r2=162(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 135
LDI r2, 162
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
