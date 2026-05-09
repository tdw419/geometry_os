; DESCRIPTION: Composite: . Then Places a magenta dot at position (222, 51). Then Places a red circle of radius 58 at center (64, 93).
; PLAN: r0=222(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=64(x), r1=93(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (222, 51).
; PLAN: r0=222(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 58 at center (64, 93).
; PLAN: r0=64(x), r1=93(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 93
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
