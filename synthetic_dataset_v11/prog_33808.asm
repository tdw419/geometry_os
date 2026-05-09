; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (56, 159) with radius 29. Then Sets a single blue pixel at (121, 213).
; PLAN: r0=56(x), r1=159(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (56, 159) with radius 29.
; PLAN: r0=56(x), r1=159(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 159
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (121, 213).
; PLAN: r0=121(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 121
LDI r1, 213
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
