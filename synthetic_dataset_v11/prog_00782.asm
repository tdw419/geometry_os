; DESCRIPTION: Composite: . Then Creates a orange circular shape at (116, 126) with radius 42. Then Sets a single white pixel at (216, 98).
; PLAN: r0=116(x), r1=126(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=216(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (116, 126) with radius 42.
; PLAN: r0=116(x), r1=126(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 126
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (216, 98).
; PLAN: r0=216(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 98
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
