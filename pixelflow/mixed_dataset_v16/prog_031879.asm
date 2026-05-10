; DESCRIPTION: Composite: Places a cyan dot at position (439, 171) then Places a green circle of radius 40 at center (216, 161).
; PLAN: r0=439(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=161(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 216
LDI r6, 161
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
