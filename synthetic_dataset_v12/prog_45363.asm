; DESCRIPTION: Places a blue circle of radius 15 at center (394, 38).
; PLAN: r0=394(x), r1=38(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 38
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
