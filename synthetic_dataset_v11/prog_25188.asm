; DESCRIPTION: Composite: . Then Renders a cyan disk with center (81, 135) and radius 12. Then Sets a single cyan pixel at (147, 250).
; PLAN: r0=81(x), r1=135(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (81, 135) and radius 12.
; PLAN: r0=81(x), r1=135(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 135
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (147, 250).
; PLAN: r0=147(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 250
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
