; DESCRIPTION: Places a orange circle of radius 22 at center (434, 116).
; PLAN: r0=434(x), r1=116(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 116
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
