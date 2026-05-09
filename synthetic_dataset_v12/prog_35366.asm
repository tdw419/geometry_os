; DESCRIPTION: Places a yellow circle of radius 17 at center (298, 203).
; PLAN: r0=298(x), r1=203(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 203
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
