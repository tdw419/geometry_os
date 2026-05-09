; DESCRIPTION: Draws a orange line from (253, 29) to (64, 160).
; PLAN: r0=253(x1), r1=29(y1), r2=64(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 29
LDI r2, 64
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
