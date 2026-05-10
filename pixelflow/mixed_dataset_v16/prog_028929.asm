; DESCRIPTION: Draws a yellow line from (474, 83) to (79, 22).
; PLAN: r0=474(x1), r1=83(y1), r2=79(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 83
LDI r2, 79
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
