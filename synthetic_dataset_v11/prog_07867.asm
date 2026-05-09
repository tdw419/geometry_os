; DESCRIPTION: Composite: . Then Places a magenta circle of radius 47 at center (180, 80). Then Places a blue dot at position (3, 239).
; PLAN: r0=180(x), r1=80(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 47 at center (180, 80).
; PLAN: r0=180(x), r1=80(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 80
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (3, 239).
; PLAN: r0=3(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
