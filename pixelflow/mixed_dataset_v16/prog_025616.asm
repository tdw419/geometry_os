; DESCRIPTION: Places a purple disk with center (394, 173) and radius 78.
; PLAN: r0=394(x), r1=173(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 173
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
