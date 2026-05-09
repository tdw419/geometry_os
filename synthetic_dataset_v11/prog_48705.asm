; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (42, 190) with radius 27. Then Places a white dot at position (240, 77).
; PLAN: r0=42(x), r1=190(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=240(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (42, 190) with radius 27.
; PLAN: r0=42(x), r1=190(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 190
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (240, 77).
; PLAN: r0=240(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
