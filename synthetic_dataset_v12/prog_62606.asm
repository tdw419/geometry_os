; DESCRIPTION: Composite: Sets a single cyan pixel at (108, 100) then Places a white circle of radius 40 at center (332, 68).
; PLAN: r0=108(x), r1=100(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=68(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 100
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 68
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
