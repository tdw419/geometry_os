; DESCRIPTION: Composite: . Then Places a yellow circle of radius 29 at center (50, 80). Then Sets a single white pixel at (233, 171).
; PLAN: r0=50(x), r1=80(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=233(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 29 at center (50, 80).
; PLAN: r0=50(x), r1=80(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 80
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (233, 171).
; PLAN: r0=233(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
