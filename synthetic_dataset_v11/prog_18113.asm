; DESCRIPTION: Draws a yellow line from (89, 173) to (74, 35).
; PLAN: r0=89(x1), r1=173(y1), r2=74(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 173
LDI r2, 74
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
