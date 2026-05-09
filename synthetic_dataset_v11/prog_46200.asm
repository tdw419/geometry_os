; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (122, 104). Then Places a red circle of radius 14 at center (178, 242).
; PLAN: r0=122(x), r1=104(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=178(x), r1=242(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (122, 104).
; PLAN: r0=122(x), r1=104(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 104
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 14 at center (178, 242).
; PLAN: r0=178(x), r1=242(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 242
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
