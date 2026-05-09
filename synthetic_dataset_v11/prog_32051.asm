; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (29, 102). Then Draws a yellow circle centered at (100, 57) with radius 54.
; PLAN: r0=29(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=100(x), r1=57(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (29, 102).
; PLAN: r0=29(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 102
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (100, 57) with radius 54.
; PLAN: r0=100(x), r1=57(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 57
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
