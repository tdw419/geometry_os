; DESCRIPTION: Composite: . Then Sets a single green pixel at (101, 231). Then Renders a cyan disk with center (55, 155) and radius 49.
; PLAN: r0=101(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=55(x), r1=155(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (101, 231).
; PLAN: r0=101(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 231
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (55, 155) and radius 49.
; PLAN: r0=55(x), r1=155(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 155
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
