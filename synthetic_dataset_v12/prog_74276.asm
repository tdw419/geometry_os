; DESCRIPTION: Draws a orange circle centered at (392, 83) with radius 48.
; PLAN: r0=392(x), r1=83(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 83
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
