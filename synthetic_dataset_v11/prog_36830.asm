; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (200, 6). Then Draws a cyan circle centered at (104, 165) with radius 53.
; PLAN: r0=200(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=104(x), r1=165(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (200, 6).
; PLAN: r0=200(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (104, 165) with radius 53.
; PLAN: r0=104(x), r1=165(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 165
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
