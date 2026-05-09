; DESCRIPTION: Composite: . Then Renders a cyan disk with center (114, 84) and radius 65. Then Sets a single cyan pixel at (174, 73).
; PLAN: r0=114(x), r1=84(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=174(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (114, 84) and radius 65.
; PLAN: r0=114(x), r1=84(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 84
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (174, 73).
; PLAN: r0=174(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
