; DESCRIPTION: Composite: . Then Places a white dot at position (141, 73). Then Places a orange circle of radius 78 at center (121, 166).
; PLAN: r0=141(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=166(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (141, 73).
; PLAN: r0=141(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange circle of radius 78 at center (121, 166).
; PLAN: r0=121(x), r1=166(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 166
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
