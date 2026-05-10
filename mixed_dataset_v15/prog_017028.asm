; DESCRIPTION: Composite: Places a blue circle of radius 14 at center (266, 96) then Sets a single yellow pixel at (284, 218).
; PLAN: r0=266(x), r1=96(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=218(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 96
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 218
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
