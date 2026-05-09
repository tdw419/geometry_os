; DESCRIPTION: Composite: . Then Places a yellow circle of radius 80 at center (109, 81). Then Places a magenta dot at position (178, 59).
; PLAN: r0=109(x), r1=81(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=178(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 80 at center (109, 81).
; PLAN: r0=109(x), r1=81(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 81
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (178, 59).
; PLAN: r0=178(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 59
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
