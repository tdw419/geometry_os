; DESCRIPTION: Places a orange circle of radius 45 at center (435, 113).
; PLAN: r0=435(x), r1=113(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 113
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
