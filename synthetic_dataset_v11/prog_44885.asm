; DESCRIPTION: Composite: . Then Places a white dot at position (4, 131). Then Draws a black circle centered at (160, 67) with radius 64.
; PLAN: r0=4(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=160(x), r1=67(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (4, 131).
; PLAN: r0=4(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (160, 67) with radius 64.
; PLAN: r0=160(x), r1=67(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 67
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
