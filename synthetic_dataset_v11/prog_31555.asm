; DESCRIPTION: Composite: . Then Draws a purple circle centered at (58, 164) with radius 31. Then Sets a single green pixel at (16, 177).
; PLAN: r0=58(x), r1=164(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=16(x), r1=177(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (58, 164) with radius 31.
; PLAN: r0=58(x), r1=164(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 164
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (16, 177).
; PLAN: r0=16(x), r1=177(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 177
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
