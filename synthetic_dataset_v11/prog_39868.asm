; DESCRIPTION: Draws a red line from (1, 1) to (192, 22).
; PLAN: r0=1(x1), r1=1(y1), r2=192(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 1
LDI r2, 192
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
