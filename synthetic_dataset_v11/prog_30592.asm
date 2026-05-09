; DESCRIPTION: Draws a orange line from (48, 205) to (128, 248).
; PLAN: r0=48(x1), r1=205(y1), r2=128(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 205
LDI r2, 128
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
