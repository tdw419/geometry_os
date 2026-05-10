; DESCRIPTION: Places a white disk with center (301, 198) and radius 45.
; PLAN: r0=301(x), r1=198(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 198
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
