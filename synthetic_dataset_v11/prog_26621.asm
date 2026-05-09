; DESCRIPTION: Composite: . Then Places a purple circle of radius 44 at center (81, 209). Then Places a magenta dot at position (138, 23).
; PLAN: r0=81(x), r1=209(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=138(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 44 at center (81, 209).
; PLAN: r0=81(x), r1=209(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 209
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (138, 23).
; PLAN: r0=138(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 23
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
