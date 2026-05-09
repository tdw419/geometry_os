; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (75, 96) with radius 38. Then Sets a single cyan pixel at (53, 5).
; PLAN: r0=75(x), r1=96(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (75, 96) with radius 38.
; PLAN: r0=75(x), r1=96(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 96
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (53, 5).
; PLAN: r0=53(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
