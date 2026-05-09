; DESCRIPTION: Places a yellow circle of radius 12 at center (226, 125).
; PLAN: r0=226(x), r1=125(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 125
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
