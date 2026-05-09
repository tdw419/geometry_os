; DESCRIPTION: Composite: . Then Places a yellow dot at position (154, 18). Then Creates a white circular shape at (157, 70) with radius 69.
; PLAN: r0=154(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=157(x), r1=70(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (154, 18).
; PLAN: r0=154(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (157, 70) with radius 69.
; PLAN: r0=157(x), r1=70(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 70
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
