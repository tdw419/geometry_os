; DESCRIPTION: Composite: . Then Draws a purple circle centered at (28, 144) with radius 22. Then Sets a single red pixel at (181, 4).
; PLAN: r0=28(x), r1=144(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=181(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (28, 144) with radius 22.
; PLAN: r0=28(x), r1=144(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 144
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (181, 4).
; PLAN: r0=181(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
