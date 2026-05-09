; DESCRIPTION: Composite: Places a yellow circle of radius 32 at center (315, 67) then Places a red dot at position (321, 40).
; PLAN: r0=315(x), r1=67(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=40(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 67
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 40
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
