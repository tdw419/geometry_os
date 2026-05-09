; DESCRIPTION: Composite: . Then Renders a yellow disk with center (237, 190) and radius 16. Then Sets a single cyan pixel at (56, 6).
; PLAN: r0=237(x), r1=190(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=56(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (237, 190) and radius 16.
; PLAN: r0=237(x), r1=190(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 190
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (56, 6).
; PLAN: r0=56(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
