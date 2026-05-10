; DESCRIPTION: Places a green circle of radius 14 at center (219, 171).
; PLAN: r0=219(x), r1=171(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 171
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
