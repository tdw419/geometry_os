; DESCRIPTION: Places a blue circle of radius 25 at center (298, 45).
; PLAN: r0=298(x), r1=45(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 45
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
