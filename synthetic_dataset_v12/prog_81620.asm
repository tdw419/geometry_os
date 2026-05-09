; DESCRIPTION: Composite: Places a white circle of radius 12 at center (404, 89) then Places a cyan dot at position (433, 200).
; PLAN: r0=404(x), r1=89(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=200(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 89
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 200
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
