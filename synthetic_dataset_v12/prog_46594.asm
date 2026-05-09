; DESCRIPTION: Places a blue circle of radius 33 at center (298, 142).
; PLAN: r0=298(x), r1=142(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 142
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
