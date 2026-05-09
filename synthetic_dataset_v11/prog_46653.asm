; DESCRIPTION: Composite: . Then Places a white circle of radius 28 at center (102, 103). Then Sets a single green pixel at (237, 239).
; PLAN: r0=102(x), r1=103(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=237(x), r1=239(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 28 at center (102, 103).
; PLAN: r0=102(x), r1=103(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 103
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (237, 239).
; PLAN: r0=237(x), r1=239(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 239
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
