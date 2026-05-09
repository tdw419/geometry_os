; DESCRIPTION: Draws a orange line from (454, 86) to (16, 21).
; PLAN: r0=454(x1), r1=86(y1), r2=16(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 86
LDI r2, 16
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
