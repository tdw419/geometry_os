; DESCRIPTION: Places a yellow circle of radius 69 at center (127, 125).
; PLAN: r0=127(x), r1=125(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 125
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
