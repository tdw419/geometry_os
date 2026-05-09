; DESCRIPTION: Composite: . Then Places a orange dot at position (230, 197). Then Places a cyan circle of radius 21 at center (67, 93).
; PLAN: r0=230(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=93(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (230, 197).
; PLAN: r0=230(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 21 at center (67, 93).
; PLAN: r0=67(x), r1=93(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 93
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
