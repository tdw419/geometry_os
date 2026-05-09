; DESCRIPTION: Composite: . Then Places a magenta circle of radius 10 at center (241, 102). Then Places a green dot at position (33, 177).
; PLAN: r0=241(x), r1=102(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x), r1=177(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 10 at center (241, 102).
; PLAN: r0=241(x), r1=102(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 102
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (33, 177).
; PLAN: r0=33(x), r1=177(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 177
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
