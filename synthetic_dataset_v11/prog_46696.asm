; DESCRIPTION: Composite: . Then Creates a white circular shape at (173, 106) with radius 74. Then Sets a single white pixel at (198, 153).
; PLAN: r0=173(x), r1=106(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=198(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (173, 106) with radius 74.
; PLAN: r0=173(x), r1=106(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 106
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (198, 153).
; PLAN: r0=198(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
