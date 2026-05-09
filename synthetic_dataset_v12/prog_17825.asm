; DESCRIPTION: Draws a orange line from (80, 254) to (384, 39).
; PLAN: r0=80(x1), r1=254(y1), r2=384(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 254
LDI r2, 384
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
