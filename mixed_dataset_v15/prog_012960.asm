; DESCRIPTION: Composite: Places a green dot at position (292, 20) then Places a cyan circle of radius 53 at center (355, 89).
; PLAN: r0=292(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=89(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 355
LDI r6, 89
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
