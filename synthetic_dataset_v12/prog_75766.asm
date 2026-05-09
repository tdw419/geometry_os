; DESCRIPTION: Composite: Sets a single orange pixel at (346, 75) then Places a red circle of radius 43 at center (101, 74).
; PLAN: r0=346(x), r1=75(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=74(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 75
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 101
LDI r6, 74
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
