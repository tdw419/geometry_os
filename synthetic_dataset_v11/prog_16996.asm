; DESCRIPTION: Composite: . Then Places a yellow circle of radius 38 at center (176, 93). Then Sets a single red pixel at (205, 45).
; PLAN: r0=176(x), r1=93(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=205(x), r1=45(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 38 at center (176, 93).
; PLAN: r0=176(x), r1=93(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 93
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (205, 45).
; PLAN: r0=205(x), r1=45(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 45
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
