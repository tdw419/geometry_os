; DESCRIPTION: Composite: . Then Creates a white circular shape at (179, 115) with radius 55. Then Sets a single cyan pixel at (150, 103).
; PLAN: r0=179(x), r1=115(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=150(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (179, 115) with radius 55.
; PLAN: r0=179(x), r1=115(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 115
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (150, 103).
; PLAN: r0=150(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
