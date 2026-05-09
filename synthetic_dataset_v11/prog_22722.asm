; DESCRIPTION: Composite: . Then Sets a single white pixel at (165, 47). Then Places a white circle of radius 30 at center (132, 120).
; PLAN: r0=165(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=132(x), r1=120(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (165, 47).
; PLAN: r0=165(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 30 at center (132, 120).
; PLAN: r0=132(x), r1=120(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 120
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
