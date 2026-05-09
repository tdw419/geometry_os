; DESCRIPTION: Composite: . Then Creates a red circular shape at (76, 63) with radius 34. Then Places a magenta dot at position (241, 148).
; PLAN: r0=76(x), r1=63(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (76, 63) with radius 34.
; PLAN: r0=76(x), r1=63(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 63
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (241, 148).
; PLAN: r0=241(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
