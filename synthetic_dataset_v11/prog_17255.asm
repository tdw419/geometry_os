; DESCRIPTION: Draws a orange circle centered at (133, 143) with radius 80.
; PLAN: r0=133(x), r1=143(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 143
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
