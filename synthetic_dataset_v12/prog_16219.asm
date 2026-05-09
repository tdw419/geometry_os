; DESCRIPTION: Draws a yellow line from (428, 205) to (118, 35).
; PLAN: r0=428(x1), r1=205(y1), r2=118(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 205
LDI r2, 118
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
