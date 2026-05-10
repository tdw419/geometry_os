; DESCRIPTION: Places a blue disk with center (298, 102) and radius 64.
; PLAN: r0=298(x), r1=102(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 102
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
