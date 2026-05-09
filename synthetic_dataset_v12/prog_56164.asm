; DESCRIPTION: Composite: Places a purple circle of radius 24 at center (146, 68) then Sets a single cyan pixel at (18, 25).
; PLAN: r0=146(x), r1=68(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=25(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 68
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 25
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
