; DESCRIPTION: Draws a orange line from (320, 168) to (56, 86).
; PLAN: r0=320(x1), r1=168(y1), r2=56(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 168
LDI r2, 56
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
