; DESCRIPTION: Places a purple circle of radius 17 at center (239, 29).
; PLAN: r0=239(x), r1=29(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 29
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
