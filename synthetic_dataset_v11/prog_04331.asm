; DESCRIPTION: Composite: . Then Draws a purple circle centered at (45, 154) with radius 35. Then Sets a single green pixel at (20, 70).
; PLAN: r0=45(x), r1=154(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (45, 154) with radius 35.
; PLAN: r0=45(x), r1=154(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 154
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (20, 70).
; PLAN: r0=20(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
