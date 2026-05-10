; DESCRIPTION: Composite: Sets a single green pixel at (220, 110) then Places a blue circle of radius 29 at center (206, 80).
; PLAN: r0=220(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=80(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 206
LDI r6, 80
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
