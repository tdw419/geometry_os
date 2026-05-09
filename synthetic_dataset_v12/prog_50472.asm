; DESCRIPTION: Draws a yellow line from (495, 38) to (170, 7).
; PLAN: r0=495(x1), r1=38(y1), r2=170(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 38
LDI r2, 170
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
