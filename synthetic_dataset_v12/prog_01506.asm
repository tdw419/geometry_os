; DESCRIPTION: Renders a orange line between points (128, 70) and (388, 240).
; PLAN: r0=128(x1), r1=70(y1), r2=388(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 70
LDI r2, 388
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
