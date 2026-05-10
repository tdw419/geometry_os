; DESCRIPTION: Draws a orange line from (7, 118) to (440, 255).
; PLAN: r0=7(x1), r1=118(y1), r2=440(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 118
LDI r2, 440
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
