; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (71, 132) with radius 69. Then Places a white dot at position (133, 164).
; PLAN: r0=71(x), r1=132(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=133(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (71, 132) with radius 69.
; PLAN: r0=71(x), r1=132(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 132
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (133, 164).
; PLAN: r0=133(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
