; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (181, 109) with radius 75. Then Sets a single cyan pixel at (188, 150).
; PLAN: r0=181(x), r1=109(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (181, 109) with radius 75.
; PLAN: r0=181(x), r1=109(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 109
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (188, 150).
; PLAN: r0=188(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 150
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
