; DESCRIPTION: Places a orange circle of radius 71 at center (392, 98).
; PLAN: r0=392(x), r1=98(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 98
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
