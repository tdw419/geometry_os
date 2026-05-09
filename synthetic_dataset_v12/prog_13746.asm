; DESCRIPTION: Composite: Sets a single yellow pixel at (410, 41) then Places a white circle of radius 27 at center (463, 67).
; PLAN: r0=410(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=67(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 463
LDI r6, 67
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
