; DESCRIPTION: Composite: Creates a yellow circular shape at (84, 92) with radius 60 then Places a cyan dot at position (284, 249).
; PLAN: r0=84(x), r1=92(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 92
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
