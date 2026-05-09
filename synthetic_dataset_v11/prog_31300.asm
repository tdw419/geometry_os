; DESCRIPTION: Composite: . Then Places a red dot at position (169, 207). Then Creates a magenta circular shape at (122, 140) with radius 74.
; PLAN: r0=169(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=122(x), r1=140(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (169, 207).
; PLAN: r0=169(x), r1=207(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 207
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (122, 140) with radius 74.
; PLAN: r0=122(x), r1=140(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 140
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
