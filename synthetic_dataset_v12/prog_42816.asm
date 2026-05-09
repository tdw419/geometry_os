; DESCRIPTION: Places a orange line segment connecting (65, 198) to (74, 173).
; PLAN: r0=65(x1), r1=198(y1), r2=74(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 198
LDI r2, 74
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
