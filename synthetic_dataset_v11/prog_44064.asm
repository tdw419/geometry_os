; DESCRIPTION: Composite: . Then Renders a purple disk with center (216, 220) and radius 34. Then Sets a single cyan pixel at (157, 159).
; PLAN: r0=216(x), r1=220(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=157(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (216, 220) and radius 34.
; PLAN: r0=216(x), r1=220(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 220
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (157, 159).
; PLAN: r0=157(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
