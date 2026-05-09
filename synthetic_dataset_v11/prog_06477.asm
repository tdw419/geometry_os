; DESCRIPTION: Composite: . Then Draws a white circle centered at (81, 83) with radius 74. Then Sets a single white pixel at (205, 51).
; PLAN: r0=81(x), r1=83(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=205(x), r1=51(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (81, 83) with radius 74.
; PLAN: r0=81(x), r1=83(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 83
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (205, 51).
; PLAN: r0=205(x), r1=51(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 51
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
