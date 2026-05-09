; DESCRIPTION: Composite: . Then Places a black dot at position (44, 70). Then Creates a yellow circular shape at (81, 72) with radius 62.
; PLAN: r0=44(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=72(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (44, 70).
; PLAN: r0=44(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (81, 72) with radius 62.
; PLAN: r0=81(x), r1=72(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 72
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
