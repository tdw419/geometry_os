; DESCRIPTION: Places a yellow disk with center (230, 28) and radius 19.
; PLAN: r0=230(x), r1=28(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 28
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
