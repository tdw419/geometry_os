; DESCRIPTION: Draws a red line from (457, 110) to (480, 22).
; PLAN: r0=457(x1), r1=110(y1), r2=480(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 110
LDI r2, 480
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
