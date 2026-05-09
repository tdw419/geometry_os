; DESCRIPTION: Composite: . Then Renders a magenta disk with center (201, 83) and radius 32. Then Places a white dot at position (25, 96).
; PLAN: r0=201(x), r1=83(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=25(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (201, 83) and radius 32.
; PLAN: r0=201(x), r1=83(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 83
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (25, 96).
; PLAN: r0=25(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
