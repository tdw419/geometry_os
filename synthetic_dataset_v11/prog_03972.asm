; DESCRIPTION: Composite: . Then Creates a green circular shape at (107, 61) with radius 24. Then Places a green dot at position (49, 141).
; PLAN: r0=107(x), r1=61(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green circular shape at (107, 61) with radius 24.
; PLAN: r0=107(x), r1=61(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 61
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (49, 141).
; PLAN: r0=49(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
