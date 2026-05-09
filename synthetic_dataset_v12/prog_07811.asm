; DESCRIPTION: Renders a orange line between points (344, 13) and (346, 175).
; PLAN: r0=344(x1), r1=13(y1), r2=346(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 13
LDI r2, 346
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
