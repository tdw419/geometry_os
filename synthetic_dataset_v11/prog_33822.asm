; DESCRIPTION: Composite: . Then Draws a black circle centered at (192, 70) with radius 27. Then Sets a single cyan pixel at (172, 26).
; PLAN: r0=192(x), r1=70(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x), r1=26(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black circle centered at (192, 70) with radius 27.
; PLAN: r0=192(x), r1=70(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 70
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (172, 26).
; PLAN: r0=172(x), r1=26(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 26
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
