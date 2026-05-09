; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (175, 105) with radius 30. Then Sets a single red pixel at (96, 12).
; PLAN: r0=175(x), r1=105(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=96(x), r1=12(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (175, 105) with radius 30.
; PLAN: r0=175(x), r1=105(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 105
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (96, 12).
; PLAN: r0=96(x), r1=12(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 12
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
