; DESCRIPTION: Composite: . Then Places a purple circle of radius 50 at center (104, 171). Then Places a magenta dot at position (120, 93).
; PLAN: r0=104(x), r1=171(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 50 at center (104, 171).
; PLAN: r0=104(x), r1=171(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 171
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (120, 93).
; PLAN: r0=120(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
