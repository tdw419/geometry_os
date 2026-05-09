; DESCRIPTION: Composite: Places a white dot at position (418, 178) then Places a green circle of radius 70 at center (230, 74).
; PLAN: r0=418(x), r1=178(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=74(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 178
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 74
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
