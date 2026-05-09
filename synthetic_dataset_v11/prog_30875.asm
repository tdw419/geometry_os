; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (192, 138) with radius 55. Then Places a white dot at position (105, 10).
; PLAN: r0=192(x), r1=138(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=105(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (192, 138) with radius 55.
; PLAN: r0=192(x), r1=138(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 138
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (105, 10).
; PLAN: r0=105(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
