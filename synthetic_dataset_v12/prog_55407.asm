; DESCRIPTION: Renders a orange line between points (110, 72) and (248, 128).
; PLAN: r0=110(x1), r1=72(y1), r2=248(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 72
LDI r2, 248
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
