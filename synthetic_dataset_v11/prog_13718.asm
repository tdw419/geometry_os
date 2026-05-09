; DESCRIPTION: Places a green circle of radius 34 at center (122, 125).
; PLAN: r0=122(x), r1=125(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 125
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
