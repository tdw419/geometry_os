; DESCRIPTION: Composite: . Then Creates a blue circular shape at (104, 119) with radius 66. Then Places a white dot at position (12, 210).
; PLAN: r0=104(x), r1=119(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue circular shape at (104, 119) with radius 66.
; PLAN: r0=104(x), r1=119(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 119
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (12, 210).
; PLAN: r0=12(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
