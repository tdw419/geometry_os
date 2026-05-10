; DESCRIPTION: Draws a orange line from (442, 56) to (128, 104).
; PLAN: r0=442(x1), r1=56(y1), r2=128(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 56
LDI r2, 128
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
