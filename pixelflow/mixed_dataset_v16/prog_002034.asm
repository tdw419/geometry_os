; DESCRIPTION: Composite: Places a yellow circle of radius 42 at center (390, 146) then Sets a single cyan pixel at (278, 48).
; PLAN: r0=390(x), r1=146(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 146
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
