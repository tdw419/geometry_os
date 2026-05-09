; DESCRIPTION: Places a orange circle of radius 73 at center (255, 165).
; PLAN: r0=255(x), r1=165(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 165
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
