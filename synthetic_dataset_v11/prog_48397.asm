; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (171, 128). Then Draws a black circle centered at (81, 113) with radius 23.
; PLAN: r0=171(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=113(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (171, 128).
; PLAN: r0=171(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (81, 113) with radius 23.
; PLAN: r0=81(x), r1=113(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 113
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
