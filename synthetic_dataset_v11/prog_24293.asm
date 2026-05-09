; DESCRIPTION: Composite: . Then Places a white circle of radius 30 at center (157, 45). Then Places a cyan dot at position (108, 255).
; PLAN: r0=157(x), r1=45(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=108(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 30 at center (157, 45).
; PLAN: r0=157(x), r1=45(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 45
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (108, 255).
; PLAN: r0=108(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
