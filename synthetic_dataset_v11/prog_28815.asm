; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (20, 236). Then Places a purple circle of radius 68 at center (149, 124).
; PLAN: r0=20(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=149(x), r1=124(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (20, 236).
; PLAN: r0=20(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 68 at center (149, 124).
; PLAN: r0=149(x), r1=124(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 124
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
