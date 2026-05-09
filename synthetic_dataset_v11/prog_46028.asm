; DESCRIPTION: Composite: . Then Sets a single blue pixel at (174, 31). Then Draws a white circle centered at (162, 121) with radius 61.
; PLAN: r0=174(x), r1=31(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=162(x), r1=121(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (174, 31).
; PLAN: r0=174(x), r1=31(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 31
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (162, 121) with radius 61.
; PLAN: r0=162(x), r1=121(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 121
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
