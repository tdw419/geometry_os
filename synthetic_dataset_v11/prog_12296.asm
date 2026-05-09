; DESCRIPTION: Composite: . Then Places a yellow dot at position (42, 68). Then Creates a black circular shape at (148, 103) with radius 63.
; PLAN: r0=42(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=148(x), r1=103(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (42, 68).
; PLAN: r0=42(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 68
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (148, 103) with radius 63.
; PLAN: r0=148(x), r1=103(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 103
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
