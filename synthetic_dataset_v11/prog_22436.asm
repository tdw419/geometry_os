; DESCRIPTION: Composite: . Then Draws a purple circle centered at (224, 215) with radius 14. Then Sets a single orange pixel at (150, 123).
; PLAN: r0=224(x), r1=215(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (224, 215) with radius 14.
; PLAN: r0=224(x), r1=215(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 215
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (150, 123).
; PLAN: r0=150(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
