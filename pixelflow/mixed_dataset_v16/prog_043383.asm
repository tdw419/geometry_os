; DESCRIPTION: Composite: Places a blue circle of radius 74 at center (224, 82) then Places a white dot at position (287, 223).
; PLAN: r0=224(x), r1=82(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=287(x), r6=223(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 82
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 287
LDI r6, 223
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
