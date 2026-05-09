; DESCRIPTION: Draws a orange circle centered at (392, 126) with radius 79.
; PLAN: r0=392(x), r1=126(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 126
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
