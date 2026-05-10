; DESCRIPTION: Places a cyan disk with center (219, 69) and radius 14.
; PLAN: r0=219(x), r1=69(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 69
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
