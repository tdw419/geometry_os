; DESCRIPTION: Renders a orange line between points (344, 56) and (448, 29).
; PLAN: r0=344(x1), r1=56(y1), r2=448(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 56
LDI r2, 448
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
