; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (83, 115) with radius 61. Then Places a green dot at position (255, 238).
; PLAN: r0=83(x), r1=115(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=255(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (83, 115) with radius 61.
; PLAN: r0=83(x), r1=115(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 115
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (255, 238).
; PLAN: r0=255(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
