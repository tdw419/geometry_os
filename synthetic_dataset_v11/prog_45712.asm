; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (132, 168) with radius 60. Then Sets a single white pixel at (248, 53).
; PLAN: r0=132(x), r1=168(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow circle centered at (132, 168) with radius 60.
; PLAN: r0=132(x), r1=168(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 168
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (248, 53).
; PLAN: r0=248(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
