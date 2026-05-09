; DESCRIPTION: Composite: . Then Draws a green circle centered at (199, 184) with radius 49. Then Places a cyan dot at position (102, 232).
; PLAN: r0=199(x), r1=184(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=102(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (199, 184) with radius 49.
; PLAN: r0=199(x), r1=184(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 184
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (102, 232).
; PLAN: r0=102(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 232
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
