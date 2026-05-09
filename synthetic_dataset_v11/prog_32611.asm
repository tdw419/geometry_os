; DESCRIPTION: Places a yellow circle of radius 42 at center (77, 125).
; PLAN: r0=77(x), r1=125(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 125
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
