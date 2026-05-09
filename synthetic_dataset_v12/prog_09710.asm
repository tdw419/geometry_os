; DESCRIPTION: Composite: Places a cyan circle of radius 54 at center (100, 115) then Sets a single cyan pixel at (300, 115).
; PLAN: r0=100(x), r1=115(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 115
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
