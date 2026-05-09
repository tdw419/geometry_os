; DESCRIPTION: Composite: . Then Places a black dot at position (17, 213). Then Places a cyan circle of radius 76 at center (137, 168).
; PLAN: r0=17(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=137(x), r1=168(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (17, 213).
; PLAN: r0=17(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 76 at center (137, 168).
; PLAN: r0=137(x), r1=168(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 168
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
