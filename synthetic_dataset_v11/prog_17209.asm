; DESCRIPTION: Composite: . Then Sets a single black pixel at (103, 145). Then Creates a magenta circular shape at (202, 91) with radius 50.
; PLAN: r0=103(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=202(x), r1=91(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (103, 145).
; PLAN: r0=103(x), r1=145(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 145
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (202, 91) with radius 50.
; PLAN: r0=202(x), r1=91(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 91
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
