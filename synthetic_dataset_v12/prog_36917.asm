; DESCRIPTION: Draws a orange line from (372, 14) to (344, 48).
; PLAN: r0=372(x1), r1=14(y1), r2=344(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 14
LDI r2, 344
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
