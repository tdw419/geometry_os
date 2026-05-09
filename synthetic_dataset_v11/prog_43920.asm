; DESCRIPTION: Composite: . Then Places a black circle of radius 50 at center (145, 69). Then Places a red dot at position (113, 196).
; PLAN: r0=145(x), r1=69(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=113(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 50 at center (145, 69).
; PLAN: r0=145(x), r1=69(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 69
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (113, 196).
; PLAN: r0=113(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
