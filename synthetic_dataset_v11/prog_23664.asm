; DESCRIPTION: Composite: . Then Places a blue dot at position (196, 221). Then Creates a yellow circular shape at (199, 151) with radius 52.
; PLAN: r0=196(x), r1=221(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=199(x), r1=151(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (196, 221).
; PLAN: r0=196(x), r1=221(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 221
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (199, 151) with radius 52.
; PLAN: r0=199(x), r1=151(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 151
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
