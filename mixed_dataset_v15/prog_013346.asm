; DESCRIPTION: Draws a orange line from (320, 128) to (378, 168).
; PLAN: r0=320(x1), r1=128(y1), r2=378(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 128
LDI r2, 378
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
