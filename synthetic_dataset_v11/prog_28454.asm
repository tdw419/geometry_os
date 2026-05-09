; DESCRIPTION: Composite: . Then Sets a single orange pixel at (224, 120). Then Places a green circle of radius 68 at center (128, 121).
; PLAN: r0=224(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=121(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (224, 120).
; PLAN: r0=224(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 68 at center (128, 121).
; PLAN: r0=128(x), r1=121(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 121
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
