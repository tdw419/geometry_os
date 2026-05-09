; DESCRIPTION: Composite: . Then Sets a single green pixel at (209, 136). Then Places a cyan circle of radius 45 at center (153, 115).
; PLAN: r0=209(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=115(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (209, 136).
; PLAN: r0=209(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 45 at center (153, 115).
; PLAN: r0=153(x), r1=115(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 115
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
