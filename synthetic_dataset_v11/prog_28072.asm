; DESCRIPTION: Composite: . Then Places a yellow dot at position (102, 251). Then Renders a magenta disk with center (76, 162) and radius 69.
; PLAN: r0=102(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=76(x), r1=162(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (102, 251).
; PLAN: r0=102(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (76, 162) and radius 69.
; PLAN: r0=76(x), r1=162(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 162
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
