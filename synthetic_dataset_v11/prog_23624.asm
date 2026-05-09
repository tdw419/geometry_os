; DESCRIPTION: Composite: . Then Sets a single white pixel at (57, 226). Then Renders a magenta disk with center (168, 196) and radius 59.
; PLAN: r0=57(x), r1=226(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=168(x), r1=196(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (57, 226).
; PLAN: r0=57(x), r1=226(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 226
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (168, 196) and radius 59.
; PLAN: r0=168(x), r1=196(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 196
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
