; DESCRIPTION: Composite: Places a cyan dot at position (505, 124) then Places a white circle of radius 35 at center (140, 200).
; PLAN: r0=505(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=200(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 505
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 200
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
