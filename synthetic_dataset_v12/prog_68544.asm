; DESCRIPTION: Composite: Places a cyan dot at position (507, 40) then Places a green circle of radius 19 at center (220, 142).
; PLAN: r0=507(x), r1=40(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=142(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 40
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 142
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
