; DESCRIPTION: Composite: Places a yellow circle of radius 59 at center (406, 163) then Places a black dot at position (258, 42).
; PLAN: r0=406(x), r1=163(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=42(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 406
LDI r1, 163
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 42
LDI r7, 0x000000
PSET r5, r6, r7
HALT
