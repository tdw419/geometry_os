; DESCRIPTION: Composite: . Then Renders a magenta disk with center (81, 162) and radius 61. Then Sets a single black pixel at (196, 227).
; PLAN: r0=81(x), r1=162(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta disk with center (81, 162) and radius 61.
; PLAN: r0=81(x), r1=162(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 162
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (196, 227).
; PLAN: r0=196(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
HALT
