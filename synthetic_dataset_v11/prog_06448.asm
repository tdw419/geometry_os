; DESCRIPTION: Composite: . Then Creates a white circular shape at (224, 194) with radius 27. Then Places a magenta dot at position (109, 9).
; PLAN: r0=224(x), r1=194(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=109(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (224, 194) with radius 27.
; PLAN: r0=224(x), r1=194(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 194
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (109, 9).
; PLAN: r0=109(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
