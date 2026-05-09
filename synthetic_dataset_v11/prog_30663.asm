; DESCRIPTION: Composite: . Then Draws a white circle centered at (64, 124) with radius 55. Then Places a purple dot at position (34, 31).
; PLAN: r0=64(x), r1=124(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=31(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (64, 124) with radius 55.
; PLAN: r0=64(x), r1=124(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 124
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (34, 31).
; PLAN: r0=34(x), r1=31(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 31
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
