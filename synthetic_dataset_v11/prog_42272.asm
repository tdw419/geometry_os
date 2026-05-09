; DESCRIPTION: Composite: . Then Creates a green circular shape at (116, 217) with radius 23. Then Places a red dot at position (177, 158).
; PLAN: r0=116(x), r1=217(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=177(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green circular shape at (116, 217) with radius 23.
; PLAN: r0=116(x), r1=217(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 217
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (177, 158).
; PLAN: r0=177(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
