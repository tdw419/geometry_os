; DESCRIPTION: Composite: . Then Draws a blue circle centered at (54, 39) with radius 11. Then Sets a single white pixel at (204, 204).
; PLAN: r0=54(x), r1=39(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=204(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (54, 39) with radius 11.
; PLAN: r0=54(x), r1=39(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 39
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (204, 204).
; PLAN: r0=204(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
