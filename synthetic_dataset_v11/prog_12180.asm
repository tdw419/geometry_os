; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (4, 12). Then Renders a purple disk with center (91, 87) and radius 22.
; PLAN: r0=4(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=91(x), r1=87(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (4, 12).
; PLAN: r0=4(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (91, 87) and radius 22.
; PLAN: r0=91(x), r1=87(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 87
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
