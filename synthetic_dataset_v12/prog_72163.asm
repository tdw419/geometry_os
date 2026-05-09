; DESCRIPTION: Draws a yellow line from (76, 115) to (350, 3).
; PLAN: r0=76(x1), r1=115(y1), r2=350(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 115
LDI r2, 350
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
