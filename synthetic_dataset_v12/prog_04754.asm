; DESCRIPTION: Composite: Creates a purple circular shape at (108, 87) with radius 48 then Places a cyan dot at position (58, 91).
; PLAN: r0=108(x), r1=87(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=91(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 87
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 91
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
