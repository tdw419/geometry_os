; DESCRIPTION: Composite: . Then Places a cyan dot at position (249, 183). Then Places a white circle of radius 38 at center (212, 79).
; PLAN: r0=249(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=212(x), r1=79(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (249, 183).
; PLAN: r0=249(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 38 at center (212, 79).
; PLAN: r0=212(x), r1=79(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 79
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
