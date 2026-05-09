; DESCRIPTION: Composite: Places a red circle of radius 30 at center (141, 84) then Places a blue dot at position (434, 24).
; PLAN: r0=141(x), r1=84(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=24(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 84
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 24
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
