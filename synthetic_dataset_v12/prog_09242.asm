; DESCRIPTION: Composite: Sets a single magenta pixel at (96, 0) then Places a white circle of radius 67 at center (292, 185).
; PLAN: r0=96(x), r1=0(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=185(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 0
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 185
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
