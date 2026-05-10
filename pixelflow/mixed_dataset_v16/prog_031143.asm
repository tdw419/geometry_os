; DESCRIPTION: Composite: Sets a single green pixel at (41, 206) then Places a red circle of radius 47 at center (259, 135).
; PLAN: r0=41(x), r1=206(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=135(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 41
LDI r1, 206
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 259
LDI r6, 135
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
