; DESCRIPTION: Composite: . Then Places a white dot at position (222, 109). Then Places a magenta circle of radius 28 at center (203, 145).
; PLAN: r0=222(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=203(x), r1=145(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (222, 109).
; PLAN: r0=222(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 28 at center (203, 145).
; PLAN: r0=203(x), r1=145(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 145
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
