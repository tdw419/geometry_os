; DESCRIPTION: Places a blue circle of radius 41 at center (279, 125).
; PLAN: r0=279(x), r1=125(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 125
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
