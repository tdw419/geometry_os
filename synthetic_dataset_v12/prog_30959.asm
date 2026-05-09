; DESCRIPTION: Places a blue circle of radius 47 at center (298, 125).
; PLAN: r0=298(x), r1=125(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 125
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
