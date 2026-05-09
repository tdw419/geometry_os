; DESCRIPTION: Composite: . Then Creates a blue circular shape at (154, 115) with radius 74. Then Sets a single white pixel at (20, 152).
; PLAN: r0=154(x), r1=115(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue circular shape at (154, 115) with radius 74.
; PLAN: r0=154(x), r1=115(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 115
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (20, 152).
; PLAN: r0=20(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 152
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
